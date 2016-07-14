# web

## How to configure
1. Create a mysql database and an user with write acces to it
2. Import `DB/dbschema.sql`
3. Set server address on
    * `WEBSITE/resources/views/includes/config.jade`
    * `WEBSITE/resources/assets/js/app.js`
4. Create `config.php` file using example on `config` directory

## How to compile
type `gulp`

## How to test locally
type `gulp serve`

**Note:** all actions must be executed in the `WEBSITE` directory

## External reosurces
### Frameworks
### Libraries

## Notes
* In the realease version we will add the compiled files

## TODO
- [ ] config.php
- [ ] installation guide
- [ ] sql
- [ ] check vue bootstrap
- [ ] apache config
- [ ] npm install
- [ ] complete schema
- [ ] guide to populate
- [ ] compiled files
- [ ] concat of js, just to show them
