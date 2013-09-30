DDD with symfony2 [1]
========================

1) Folder structure and code first
----------------------------------
### Domain Layer
This layer is the heart of your application. Business rules and logic live inside this layer. Business entity state and
behavior are defined and used here.

The Domain Layer should be reusable, and loosely coupled.

  * CoreDomain: users related stuff
  * CoreDomain\User\User: Entity
  * CoreDomain\User\UserId: Value object
  * CoreDomain\User\UserRepository: mediates between the domain and data mapping using a collection-like interface for
    accessing domain objects.


### Infrastructure Layer
The Infrastructure Layer contains technical services, persistence, and more generally, concrete implementations of the
Domain Layer.

  * CoreDomainBundle: integrate CoreDomain package into Symfony2 project
  * CoreDomainBundle\InMemoryUserRepository: located into the CoreDomainBundle bundle because it is specific to the
    application.

### Application Layer
The Application Layer is in charge of coordinating the actions to be performed on the domain, and delegates all domain
actions to the domain itself. It does not contain business rules or knowledge. It does not have state reflecting the
business situation, but it can have state that reflects the progress of a task for the user or the program.

  * ApiBundle

[1]: http://williamdurand.fr
[2]: http://williamdurand.fr/2013/08/07/ddd-with-symfony2-folder-structure-and-code-first/
