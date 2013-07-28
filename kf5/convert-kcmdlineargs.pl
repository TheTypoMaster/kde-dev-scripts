#!/usr/bin/perl -w

# David Faure <faure@kde.org>
# KCommandLineArgs -> QCommandLineParser

use strict;
use File::Basename;
use lib dirname($0);
use functionUtilkde;
my $use_tr;

# Set $use_tr to generate code that uses QCoreApplication::translate
# If it's not set, i18n will be used.
#$use_tr = 1;

foreach my $file (@ARGV) {
    my $context = "\"main\"";
    my $opt;
    my $short = "";
    my $args;
    my %negatedOptions = ();

    functionUtilkde::substInFile {
        if (/KCmdLineOptions (\w*)/) {
            $opt = $1;
            s/KCmdLineOptions /QCommandLineParser \*/;
            s/$opt/parser = new QCommandLineParser/;
            $_ .= "    app.setApplicationVersion(INSERT_VERSION_HERE);\n";
            $_ .= "    parser->addVersionOption();\n";
            $_ .= "    parser->addHelpOption(INSERT_DESCRIPTION_HERE);\n";
        } elsif (defined $opt && /KCmdLineArgs::addCmdLineOptions\s*\(\s*$opt\s*\)/ || /KCmdLineArgs::init/) {
            $_ = "";
        } elsif (defined $opt && /(.*)$opt.add\s*\(\s*"([^\"]*)"\s*\)/) { # short option
            $_ = "";
            $short = "\"$2\" << ";
        } elsif (defined $opt && /(.*)$opt.add\s*\(\s*"([^\"]*)"\s*,\s*k(i18nc?)\((.*)\)\s*(?:,\s*([^\)]*))?\)/) {
            my $prefix = $1; # e.g. indent
            my $name = $2;
            my $i18n = $3;
            my $description = $4;
            my $defaultValue = $5;
            my $trail = "";
            if ($name =~ /(\w*) <(.*)>/) { # "stylesheet <xsl>"
                $name = $1;
                $trail = ", \"$2\"";
            }
            if (defined $defaultValue) {
                $trail .= ", false, $defaultValue";
            } elsif ($name =~ /^no/) { # negative option, e.g. --nosignal
                $negatedOptions{$name} = 1;
            }
            my $translate = defined $use_tr ? "QCoreApplication::translate($context, $description)" : "$i18n($description)";
            $_ = "${prefix}parser->addOption(QCommandLineOption(QStringList() << $short\"$name\", $translate$trail));\n";
            $short = "";
        } elsif (/KCmdLineArgs\s*\*(\w*)\s*=\s*KCmdLineArgs::parsedArgs\(\s*\)/) {
            $args = $1;
            $_ = "";
        } else {
            s/KCmdLineArgs::qtArgc\(\)/argc/;
            s/KCmdLineArgs::qtArgv\(\)/argv/;
            if (defined $args) {
                s/${args}\->getOptionList/parser->arguments/;
                s/${args}\->getOption/parser->argument/;
                s/${args}\->isSet/parser->isSet/;
                s/${args}\->count/parser->remainingArguments().count/;
                s/${args}\->usage\s*\(\)/parser->showHelp()/;
                s/KCmdLineArgs::usage\s*\(\)/parser->showHelp()/;
                if (/arguments?\(\"(\w*)/ || /isSet\(\"(\w*)/) {
                    my $optionName = $1;
                    if (defined $negatedOptions{"no$optionName"}) {
                        s/$/\/\/ TODO: negate check (and ensure nobody passes the no-op --$optionName argument)/;
                        s/$optionName/no$optionName/g;
                    }
                }
            }
        }
        $_;
    } $file;
    if (`grep QCommand $file | grep -v '#include'`) {
      functionUtilkde::removeIncludeInFile($file, "kcmdlineargs.h");
      functionUtilkde::addIncludeInFile($file, "qcommandlineparser.h");
      functionUtilkde::addIncludeInFile($file, "qcommandlineoption.h");
    }
}

functionUtilkde::diffFile( "@ARGV" );