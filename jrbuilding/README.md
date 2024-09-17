jrbuilding
==========

Small ruby on rails app for building manager to keep track of his properties.

Note these improvements could be made after upgrading from Rails 4.2 to 5.0.
1. [Requires running build] Remove the Heroku buildpack -- Heroku has no more free tier, so this will have to run locally until a new host is found.
2. [Requires running build] Try to move prawn to a gem. It's here: https://github.com/prawnpdf/prawn
3. [Requires running build] Figure out what pdftk-source does and how it connects to Prawn. Maybe prawn includes it?