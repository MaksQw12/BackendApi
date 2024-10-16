﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Backend.Models;
using Microsoft.CodeAnalysis;

namespace Backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BasketsController : ControllerBase
    {
        private readonly MaksdiplomContext _context;

        public BasketsController(MaksdiplomContext context)
        {
            _context = context;
        }

        [HttpDelete("user/{userId}")]
        public async Task<IActionResult> DeleteAllItemsForUser(int userId)
        {
            try
            {
                var basketItems = await _context.Baskets.Where(b => b.IdUser == userId).ToListAsync();
                if (basketItems == null || !basketItems.Any())
                {
                    return NotFound($"There are no items in the basket for user with ID {userId}.");
                }

                _context.Baskets.RemoveRange(basketItems);
                await _context.SaveChangesAsync();

                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"An error occurred while deleting basket items for user with ID {userId}: {ex.Message}");
            }
        }

        [HttpGet("user/{userId}")]
        public async Task<ActionResult<IEnumerable<Product>>> GetBasketByUserId(int userId)
        {
            var basketItems = await _context.Baskets
                .Where(b => b.IdUser == userId)
                .Include(b => b.IdProductNavigation)
                .Select(b => new
                {
                    b.Id,
                    b.Count,
                    Product = new
                    {
                        b.IdProductNavigation.Id,
                        b.IdProductNavigation.ProductName,
                        b.IdProductNavigation.Description,
                        b.IdProductNavigation.Price,
                        b.IdProductNavigation.Image
                    }
                })
                .ToListAsync();

            if (basketItems == null)
            {
                return NotFound();
            }

            return Ok(basketItems);
        }

        // GET: api/Baskets
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Basket>>> GetBaskets(int? userId = null, int? productId = null)
        {
            if (userId != null && productId != null)
            {
   
                var basketItem = await _context.Baskets.FirstOrDefaultAsync(b => b.IdUser == userId && b.IdProduct == productId);
                if (basketItem == null)
                {
                    return NotFound();
                }
                return Ok(basketItem);
            }
            else
            {
    
                return await _context.Baskets.ToListAsync();
            }
        }


        // GET: api/Baskets/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Basket>> GetBasket(int id)
        {
          if (_context.Baskets == null)
          {
              return NotFound();
          }
            var basket = await _context.Baskets.FindAsync(id);

            if (basket == null)
            {
                return NotFound();
            }

            return basket;
        }

        // PUT: api/Baskets/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBasket(int id, Basket basket)
        {
            if (id != basket.Id)
            {
                return BadRequest();
            }

            _context.Entry(basket).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BasketExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Baskets
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Basket>> PostBasket(Basket basket)
        {
          if (_context.Baskets == null)
          {
              return Problem("Entity set 'MaksdiplomContext.Baskets'  is null.");
          }
            _context.Baskets.Add(basket);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetBasket", new { id = basket.Id }, basket);
        }

        // DELETE: api/Baskets/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBasket(int id)
        {
            if (_context.Baskets == null)
            {
                return NotFound();
            }
            var basket = await _context.Baskets.FindAsync(id);
            if (basket == null)
            {
                return NotFound();
            }

            _context.Baskets.Remove(basket);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool BasketExists(int id)
        {
            return (_context.Baskets?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
