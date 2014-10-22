#!/usr/bin/env perl -w

use strict;
use Test;

BEGIN { plan tests => 2 }

use Lingua::UK::Jcuken;

ok(Lingua::UK::Jcuken::jcu2qwe('��㪥�', 'cp866'), ']werty');
ok(Lingua::UK::Jcuken::jcu2qwe('������'), "s]'qwe");

exit;
