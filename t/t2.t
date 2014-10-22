#!/usr/bin/env perl -w

use strict;
use Test;

BEGIN { plan tests => 3 }

use Lingua::UK::Jcuken;

ok(Lingua::UK::Jcuken::jcu2qwe('��㪥�', 'cp866'), 'qwerty');
ok(Lingua::UK::Jcuken::jcu2qwe('��஫�', 'cp866'), 'gfhjkm');
ok(Lingua::UK::Jcuken::jcu2qwe('qwerty', 'cp866'), 'qwerty');

exit;
