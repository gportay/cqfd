#!/usr/bin/env -S cqfd -b pkg shell
exec makepkg --skipchecksums "$@"
