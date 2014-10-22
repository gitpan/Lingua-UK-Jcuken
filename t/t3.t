#!/usr/bin/env perl -w

use strict;
use Test;

BEGIN { plan tests => 3 }

use Lingua::UK::Jcuken;

ok(Lingua::UK::Jcuken::qwe2jcu('qwerty', 'cp866'), '��㪥�');
ok(Lingua::UK::Jcuken::qwe2jcu('gfhjkm', 'cp866'), '��஫�');
ok(Lingua::UK::Jcuken::qwe2jcu('��㪥�', 'cp866'), '��㪥�');

exit;
