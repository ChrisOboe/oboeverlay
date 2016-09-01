# how do i activate the overlay?

Copy the following into `/etc/portage/repos.conf/overlays.conf`

```
[oboeverlay]
location = /var/lib/portage/repos/oboeverlay
priority = 200
auto-sync = yes
sync-type = git
sync-uri = https://git.smackmack.industries/ChrisOboe/oboeverlay.git
```
