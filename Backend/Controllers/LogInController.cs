using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Backend.Models;
using System.Net.Mail;
using System.Net;

namespace Backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LogInController : ControllerBase
    {
        private readonly MaksdiplomContext _context;
        public static string verificationCode;

        public LogInController(MaksdiplomContext context)
        {
            _context = context;
        }

        [HttpPost("GetCode")]
        public async Task<ActionResult<int>> SendVerificationCode(User user)
        {
            var existingUser = await _context.Users.FirstOrDefaultAsync(p => p.UserName == user.UserName && p.Email == user.Email);
            if (existingUser == null)
                return BadRequest("Пользователь не найден");
            verificationCode = GenerateVerificationCode();
            await SendEmail(user.Email, verificationCode);
            return existingUser.Id;
        }

        [HttpPost("Auth")]
        public async Task<ActionResult<User>> LogIn(UserLogIn logIn)
        {
            var existingUser = await _context.Users.FindAsync(logIn.userId);
            if (existingUser == null)
                return BadRequest("Пользователь не найден");

            if (logIn.vereficationCode != verificationCode)
                return BadRequest("Код не совпадает");

            return Ok("Вход...");
        }

        private string GenerateVerificationCode()
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var random = new Random();
            return new string(Enumerable.Repeat(chars, 6).Select(s => s[random.Next(s.Length)]).ToArray());
        }

        private async Task SendEmail(string email, string verificationCode)
        {

            MailAddress from = new MailAddress("WorkToCode@yandex.ru");
            MailAddress to = new MailAddress($"{email}");
            MailMessage m = new MailMessage(from, to);
            m.Subject = "Код подтверждения";
            m.Body = $"<h2>Ваш код: {verificationCode}</h2>";
            m.IsBodyHtml = true;


            SmtpClient smtp = new SmtpClient("smtp.yandex.ru", 587);

            smtp.Credentials = new NetworkCredential("WorkToCode@yandex.ru", "zhqxykfwxworadvl");
            smtp.EnableSsl = true;
            await smtp.SendMailAsync(m);
        }


        private bool UserExists(int id)
        {
            return (_context.Users?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
