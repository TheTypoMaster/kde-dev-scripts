#!/usr/bin/perl -w

# Laurent Montel <montel@kde.org> (2014)
# KIcon("...") => QIcon::fromTheme("...")
# find -iname "*.cpp" -o -iname "*.h"|xargs kde-dev-scripts/kf5/convert-kicon.pl

use strict;
use File::Basename;
use lib dirname($0);
use functionUtilkde;

foreach my $file (@ARGV) {

    my $modified;
    open(my $FILE, "<", $file) or warn "We can't open file $file:$!\n";
    my @l = map {
        my $orig = $_;
        if (/KIcon\(\s*\)/ ) {
           s/KIcon\(\s*\)/QIcon()/;
        }
        s/\bKIcon\b\s*\(/QIcon::fromTheme(/g;
        s/\<KIcon\b\>/\<QIcon>/ =~ /#include/ ;
        s/\<kicon.h\b\>/\<QIcon>/ =~ /#include/ ;

        $modified ||= $orig ne $_;
        $_;
    } <$FILE>;

    if ($modified) {
        open (my $OUT, ">", $file);
        print $OUT @l;
        close ($OUT);
    }
}

functionUtilkde::diffFile( "@ARGV" );
