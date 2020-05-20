- Download repo (you'll probably want to remove the .git folder)
- Copy .env.example to .env
- Set DB_PASSWORD and DB_DATABASE
- Verify ports and project name in .env. These are the local ports that you'll use to reach your docker resources. Make sure they don't conflict with any other project
- Create Quasar and Laravel apps. Run:
`doc create`

- Update your laravel .env 
    - Update DB_HOST to mysql
    - Copy DB_DATABASE and DB_PASSWORD settings from root .env

(Optional) Review, then move the Quasar .vscode folder to your root, if desired

Test it
 - `http://localhost:{QUASAR_PORT}`
 - `http://localhost:{LARAVEL_PORT}`

Available Commands:

-`doc up` //bring up containers

-`doc down` //bring down containers

-`doc restart` // restart containers

-`doc rebuild` // restart with build

-`doc art` //run artisan

-`doc composer` //run composer

-`doc php` //run php command

-`doc app` //bash into the Laravel/php container

-`doc node` //bash into the the Quasar/node container