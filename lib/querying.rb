def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year FROM books WHERE series_id = 1 ORDER BY year ASC;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters ORDER BY length(motto) DESC LIMIT 1;"
end

def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) AS species_count FROM characters GROUP BY species ORDER BY species_count DESC limit 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM series JOIN subgenres ON subgenre_id = subgenres.id
    JOIN authors ON author_id = authors.id;"
end

def select_series_title_with_most_human_characters
  # "SELECT series.title FROM series JOIN characters ON series_id = series.id ORDER BY MAX(COUNT(characters.species)) HAVING characters.species = 'human' LIMIT 1;"
  # SELECT series.title, COUNT(characters.species) FROM series JOIN characters ON series_id = series.id GROUP BY series.title HAVING characters.species = 'human';"
  "SELECT title FROM (SELECT series.title, COUNT(characters.species) FROM series JOIN characters ON series_id = series.id GROUP BY series.title HAVING characters.species = 'human' ORDER BY COUNT(characters.species) DESC LIMIT 1);"

end

def select_character_names_and_number_of_books_they_are_in
  "SELECT name, COUNT (character_books.book_id) AS book_count FROM characters JOIN character_books ON characters.id = character_books.character_id GROUP BY name ORDER BY book_count DESC;"
end
