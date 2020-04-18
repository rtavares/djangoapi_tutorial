# Django Api Tutorial Project
## Django Web App - Headless API

# Initial notes
Fancy to programming? Love to program in Python?
So, we start believing that programming is about to learn one programming language.
And during some - normally short - time, it still true.
We can keep playing with short scripts and small projects that require no more than Python itself and a simple code editor.

However very soon, normally sooner than we will expect, we will create something that we would love to share with the world.

And it's the moment we realize that the world where we want to set our project free, became a quite complex place...
And we quickly learn that our beloved programming language, to be able to shine, bring a lot of friends alongside with him.

Welcome to the Wild Wild Web! I'm sorry, I mean the World Wide Web. ;-)    

So, to be able to make our baby project leave the nest and spread their wings, we will need to make ourselves familiar with Virtual environments, integrated development environments, code lints, repository managers, version control, containerization, orchestrators, web servers, and the list could keep growing... ;-)

Oh, yes, and deploy.
We will come to that at certain  time.
    
Sounds overwhelming? Have no fear. It only hurt a bit at the beginning. ;-) 

So, this is a Django pet project to create a sample project with the goal to demonstrate the usage of the different technologies required to deliver a project on the web.

Specifically, a headless Django - google for that (GFT) - running on Docker.

About Python and Django there is plenty of sources around the web. 

To build ourt pet project, we will be 'standing on the shoulders of the giants', meaning following a couple of tutorials along the project. Thank you everyone that took time and effort to set this tutorials.

If you look at that tutorials,  you will notice that we are not following it line-by-line. Instead adapting their teachings to the way we prefer to do the things.

Please feel free to disagree. :-)

##Tech stack - Development environment 
- IDE - Pycharm
- Virtual environment manager - Pipenv
- Running environment variables manager - python-dotenv
- Programming language Python 3.7
- Code linter - Flake8
- Web framework - Django 3.0.5
- REST API - Django Rest Framework
- Running environment - `Docker` containers and `docker-compose` 
- Database - PostGreSQL - on Docker  
- Manging and using the project - Gnu Make

Some extra perks:
- Beautify Django Admin - django-grappelli
- Better debug and manage utilities - iPython and ipdb

## Some comments
- Virtual environments  
Using virtual environments in Python/Django development is not and option. :-)
There have several different options to create and use virtual environments. We choose Pipenv.
There have a lot of opinions about every one of them. 
There is a good thing about Python/Django community: there is a rich and thriving community, keen of sharing views. GFT.

- .env - environment variables and security  
We have to define working environment variables in several places of the projects.
To avoid the hassle of having to change values on several places, a good tip it to use a central file holding all of that values - the 'single source of truth', and the only place to make a change.
Please be aware that this file should neve be commited, once may contain sensible information, like project and database credentials or cloud access credentials.

- Django Secret Key  
This is another piece that is sensible  for the security of a Django project.  
We use a small trick to guarantee a unique adn secret 'secret key'. 
Once again, there is a lot of opinions about the best way to keep the secret key, secret.
Once again... GFT! :-)

## Tutorial sources   

Django project:   
Medium - Oyetoke Tobi Emmanuel   
- https://medium.com/fbdevclagos/building-future-web-apps-with-javascript-and-django-c831883b22cf   
- https://medium.com/fbdevclagos/building-a-rest-api-endpoint-for-ticket-app-with-django-part1-3213d8622c9d   
- https://medium.com/@oyetoketoby80/building-a-rest-api-endpoint-for-ticket-app-with-django-part2-f60163545995   

Dockerizing:   
- https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/   

## Running the project
- Tested on Mac OS Catalina - 10.15.4
- Requires `Docker` installed - https://docs.docker.com/engine/install/
- Requires `Git` installed - https://git-scm.com/downloads
- Requires `make` installed - any decent `*nix` system should have it.    
  Otherwise... https://www.gnu.org/software/make/
- Clone the project
- Rename `.env_sample` to `.env`
- And after that, running `make` would be quite self-explanatory. :-)  
  Starting points will be `make build` and `make start`.  
  After that you sould have the beautiful Django starting screen in the usual place of http://localhost:8080   

## Some other notes  
- For a question of personal preference, normally I always start new Django projects as `project` with a Main App named... Yes, you got it: `main` ;-) .
- When working with `docker-compose` be aware of the command `docker-compose down`.   
It will remove the project volumes, which means you will loose your database content
 
 Enjoy and have Fun! :-D 
---------------------

