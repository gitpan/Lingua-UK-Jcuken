#!/usr/bin/env perl -w

use strict;
use Test;

BEGIN { plan tests => 2 }

use Lingua::UK::Jcuken;

ok(Lingua::UK::Jcuken::qwe2jcu(']werty', 'cp866'), '��㪥�');
ok(Lingua::UK::Jcuken::qwe2jcu("s]'qwe"), '������');

exit;
