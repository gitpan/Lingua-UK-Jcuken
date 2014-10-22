# Lingua/UK/Jcuken.pm
#
# Copyright (c) 2006 Serguei Trouchelle. All rights reserved.
#
# This program is free software; you can redistribute it and/or modify it
# under the same terms as Perl itself.

# History:
#  1.01  2006/11/15 Initial revision

=head1 NAME

Lingua::UK::Jcuken -- Conversion between QWERTY and JCUKEN keys in Ukrainian

=head1 SYNOPSIS

 use Lingua::UK::Jcuken qw/ jcu2qwe qwe2jcu /;

 print qwe2jcu('qwerty', 'koi8-r'); # prints "jcuken" in koi8-r

=head1 DESCRIPTION

Lingua::UK::Jcuken can be used for conversion between two layouts on Ukrainian keyboards.

=head1 METHODS

=cut

package Lingua::UK::Jcuken;

require Exporter;
use Config;

use strict;
use warnings;

use Text::Iconv;

our @EXPORT      = qw/ /;
our @EXPORT_OK   = qw/ jcu2qwe qwe2jcu /;
our %EXPORT_TAGS = qw / /;
our @ISA = qw/Exporter/;

our $VERSION = "1.01";

my $table = q!1 1
q �
w �
e �
r �
t �
y �
u �
i �
o �
p �
[ �
] �
a �
s �
d �
f �
g �
h �
j �
k �
l � 
; �
' �
z �
x �
c �
v �
b �
n �
m �
, �
. �
/ .
` �
Q �
W �
E �
R �
T �
Y �
U �
I �
O �
P �
{ �
} �
A �
S �
D �
F �
G �
H �
J �
K �
L �
: �
" �
Z �
X �
C �
V �
B �
N �
M �
< �
> �
? .
~ �
2 2!;

our %qwe2jcu = split /\s+/, $table;
our %jcu2qwe = reverse split /\s+/, $table;

=head2 jcu2qwe ( $string, [ $encoding ])

This method converts $string from Jcuken to Qwerty.

Optional $encoding parameter allows to specify $string's encoding (default is 'windows-1251')

=cut

sub jcu2qwe {
  my $val = shift;
  my $enc = shift;
  if ($enc) {
    my $converter = Text::Iconv->new($enc, "windows-1251");
    $val = $converter->convert($val);
  } # else think of windows-1251
  my $res = '';
  foreach (split //, $val) {
    $_ = $jcu2qwe{$_} if $jcu2qwe{$_};
    $res .= $_;
  }
  return $res;
}

=head2 qwe2jcu ( $string, [ $encoding ])

This method converts $string from Qwerty to Jcuken.

Optional $encoding parameter allows to specify result encoding (default is 'windows-1251'). 
It is also used as $string encoding if you have cyrillic in it.

=cut

sub qwe2jcu {
  my $val = shift;
  my $enc = shift;
  my $converter;
  if ($enc) {
    my $converter = Text::Iconv->new($enc, "windows-1251");
    $val = $converter->convert($val);
  } else { # think of windows-1251
    $enc = 'windows-1251';
  }
  $converter = Text::Iconv->new("windows-1251", $enc);
  my $res = '';
  foreach (split //, $val) {
    $_ = $qwe2jcu{$_} if $qwe2jcu{$_};
    $res .= $converter->convert($_);
  }
  return $res;
}

1;

=head1 AUTHORS

Serguei Trouchelle E<lt>F<stro@railways.dp.ua>E<gt>

=head1 COPYRIGHT

Copyright (c) 2006 Serguei Trouchelle. All rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
