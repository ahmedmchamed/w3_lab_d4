# TERRIBLE NEWS!

IMDB, the world's most famous internet movie database, has _crashed!_ The Powers That Be have phoned CodeClan and specifically tasked YOU with rebuilding it from scratch! So soon into the course? We tried to tell them, but they wouldn't listen!

But help is at hand, because they've given you a spec to work to:

## the new IMDB should have:
  - Movies
    - title
    - genre

  - :star: Stars :star:
    - first name
    - last name

  - Castings
    - movie_id
    - star_id
    - fee
    
## MVP

### CRUD

  - handle `save` and `delete_all` so you can add / remove from the tables (`all` could be helpful too, or just use Postico for verification)
  - **(Optionally)** finish the other CRUD methods (`update`, `delete`, `all`, `find_by_id` etc), or if you feel comfortable with these you could skip to:
  
### Many-to-Many
 
  - get all the stars for a particular movie (requires an `INNER JOIN`)
  - and get all the movies a particular star is cast in (requires an `INNER JOIN`)
  
### One-to-Many  
  
   - **(Optionally)** add methods for the one-to-many relationships. (e.g. so we can call `movie1.castings`, `casting1.movie`, `star1.castings`, `casting1.star`), or if you feel comfortable with these you could skip to:

## Extension

Add a budget to your movie model and create a method that will return the remaining budget once all a movie's star's fees have been taken into consideration!
