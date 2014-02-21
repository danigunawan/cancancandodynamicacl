# Can CanCan Do Dyanamic ACL?
There wasn't a whole lot of explicit documentation around instance level
authorization in CanCan. Specifically I wanted to show that authorization could be
dynamically applied through a polymorphic link table that mimics a
database driven ACL.

This proof-of-concept attempts to demonstrate a scenario where instances of
reports could authorize roles, and/or specific users to view reports.

The models explicitely represented are as follows:

* User (devise registration/authenticate)
* Organization (currently unused)
* Role (rolify, currently on User only)
* Report
* Ability (CanCan, no AR tables)
* AuthorizedCollaborator (double-sided polymorphic ACL table)

Rails doesn't play well with double-sided polymorphic tables out of the box, so
there will be a little extra setup in the console that I didn't feel like
building out.

## POC Setup
Clone the repo, bundle up dependencies and migrate the database. Sign up
with a couple of users and use the console to setup roles.

```@user.add_role :admin```

Create a couple of reports (currently only available through the console):

```
@report = Report.create(
  name: 'A Fancy Report',
  description: 'This fancy report has lots of fancy'
)
```

Assign access to the report through `AuthorizedCollaborator` while manually
filling in the other side of the polymorphic association for `Role` and `User`
as you see fit.

```
@report.collaborators.create(accessible_type: 'Role', accessible_id: @role.id)
@report.collaborators.create(accessible_type: 'User', accessible_id: @user.id)
```

Then through the UI you should receive an alert for any report you did not give
access to. (I assume you know how to spin up the rails server).

I suggest trying this out with a few scenarios:

* Administrative user with access to everything (:admin role is already given this privelage throughout)
* Advanced user with access to all the reports
* Basic user with access to only some of the reports

Log in an out of each of these to verify your assumptions.
