# RepositoriesExample

A very small example of DDD's repository pattern in Ruby.

It separates the responsibility of persistence and business rules, avoiding fat
models.

In big applications, those concerns should be separated.

## Layers

* Entities: Business objects (without any persistence rule or DB acccess - PORO)
* Repositories: Responsible to communicate with data sources and to convert
the resulting info into business entities
  * DTOs: Responsible to connect to the DB and to has the persistence rules
  * Mappers: Responsible to map business entities into DTOs and vice-versa


## Console

    $ script/console

