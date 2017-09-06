# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

1. Generate the App

Create a new Rails application called "Codaisseurify".
Make sure that the app uses PostgreSQL for the database.
2. Models

Create two models: Song and Artist.
Define the relationship between them:
A song can only be linked to one artist.
An artist can have many songs.
3. Seeds

Create some initial data adding some seeds to the database with some songs and artists.
The seeds should reflect the association between every song and its artist.


AJAX & Integration Testing

Adding AJAX

Refactor some of the existent functionalities in the artist detail page to meet the following requirements:
Visitors can add songs related to an artist via AJAX. This should happen in the show page of the artist.
Visitors can remove songs related to an artist via AJAX. This should happen in the show page of the artist.
Visitors can delete all songs for that artist with only one click via AJAX. This should happen in the show page of the artist.

Testing

Write some integration tests related to the three new functionalities that you just added:
Add a new song
Remove a song
Remove all songs
