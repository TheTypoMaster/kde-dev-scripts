#!/usr/bin/perl -w

use POSIX;

my %fix = (
         "aasumes" => "assumes",
         "acces" => "access",
         "accesible" => "accessible",
	 "accesing" => "accessing",
	 "accomodate" => "accommodate",
	 "acommodate" => "accommodate",
	 "Acknowlege" => "Acknowledge",
	 "acknoledged" => "acknowledged",
	 "acknowledgement" => "acknowledgment",
	 "Acknowledgements" => "Acknowledgments",
	 "aquire" => "acquire",
	 "accross" => "across",
	 "actons" => "actions",
	 "adapater" => "adapter",
	 "adatper" => "adapter",
	 "additionnal" => "additional",
	 "Addtional" => "Additional",
	 "adress" => "address",
         "adresses" => "addresses",
	 "adddress" => "address",
	 "Adress" => "Address",
	 "Agressive" => "Aggressive",
	 "agressively" => "aggressively",
	 "alligned" => "aligned",
	 "alignement" => "alignment",
	 "allready" => "already",
         "alrady" => "already",
	 "Allways" => "Always",
	 "allways" => "always",
	 "ammount" => "amount",
	 "analogue" => "analog",
	 "analyse" => "analyze",
	 "analyses" => "analyzes",
         "anwsers" => "answers",
         "appers" => "appears",
         "appearence" => "appearance",
         "appeareance" => "appearance",
         "applicaiton" => "application",
	 "appropiate" => "appropriate",
	 "approriate" => "appropriate",
	 "apropriate" => "appropriate",
         "aribrary" => "arbitrary",
	 "arbitarily" => "arbitrarily",
	 "aribtrarily" => "arbitrarily",
	 "Arbitary" => "Arbitrary",
	 "aribtrary" => "arbitrary",
	 "arround" => "around",
	 "asssembler" => "assembler",
	 "assosciated" => "associated",
	 "assosiated" => "associated",
	 "asume" => "assume",
	 "asyncronous" => "asynchronous",
	 "atleast" => "at least",
         "aticles" => "articles",
	 "atomicly" => "atomically",
	 "Auxilary" => "Auxiliary",
         "automaticaly" => "automatically",
	 "availble" => "available",
	 "availible" => "available",
	 "avaliable" => "available",
	 "Basicly" => "Basically",
	 "basicly" => "basically",
	 "becuase" => "because",
         "beautifull" => "beautiful",
         "befor" => "before",
	 "beggining" => "beginning",
	 "behaviour" => "behavior",
	 "beeing" => "being",
	 "boundries" => "boundaries",
	 "boundry" => "boundary",
	 "cancelation" => "cancellation",
         "cancelled" => "canceled",
	 "capabilites" => "capabilities",
	 "catalogue" => "catalog",
	 "catched" => "caught",
         "ceneration" => "generation",
	 "changable" => "changeable",
	 "charater" => "character",
         "caracters" => "characters",
	 "centre" => "center",
	 "Centre" => "Center",
	 "Characteres" => "Characters",
	 "choosed" => "chose",
	 "choosen" => "chosen",
         "chosing" => "choosing",
	 "cirumstances" => "circumstances",
         "coloum" => "column",
	 "colour" => "color",
         "coloumn" => "column",
         "cloumn" => "column",
	 "comming" => "coming",
	 "comamnd" => "command",
	 "commense" => "commence",
	 "commited" => "committed",
	 "commuication" => "communication",
	 "comparision" => "comparison",
	 "comparisions" => "comparisons",
	 "compability" => "compatibility",
	 "Compatability" => "Compatibility",
	 "compatibilty" => "compatibility",
	 "compatiblity" => "compatibility",
	 "completly" => "completely",
         "compleion" => "completion",
	 "comsumer" => "consumer",
	 "concurent" => "concurrent",
	 "configration" => "configuration",
	 "consequtive" => "consecutive",
	 "konstants" => "constants",
         "connent" => "connect",
         "connnection" => "connection",
	 "contigious" => "contiguous",
	 "contingous" => "contiguous",
	 "Continous" => "Continuous",
	 "continous" => "continuous",
	 "controll" => "control",
	 "contoller" => "controller",
	 "controler" => "controller",
	 "controling" => "controlling",
	 "Coverted" => "Converted",
	 "coresponding" => "corresponding",
         "coursor" => "cursor",
	 "curteousy" => "courtesy",
	 "deactive" => "deactivate",
	 "Debuging" => "Debugging",
	 "debuging" => "debugging",
	 "defered" => "deferred",
	 "defintions" => "definitions",
	 "dependend" => "dependent",
	 "depricated" => "deprecated",
	 "dialogue" => "dialog",
         "disappers" => "disappears",
         "discription" => "description",
	 "decriptor" => "descriptor",
	 "desciptor" => "descriptor",
	 "developped" => "developed",
	 "didnt" => "didn't",
	 "differenciate" => "differentiate",
         "diable" => "disable",
	 "discpline" => "discipline",
	 "discontigous" => "discontiguous",
	 "distingush" => "distinguish",
	 "devide" => "divide",
	 "divizor" => "divisor",
	 "Donot" => "Do not",
	 "donnot" => "do not",
	 "doens't" => "doesn't",
	 "doesnt" => "doesn't",
	 "dont't" => "don't",
	 "dreamt" => "dreamed",
	 "dynamicly" => "dynamically",
	 "efficent" => "efficient",
	 "imperical" => "empirical",
	 "enhandcements" => "enhancements",
	 "enought" => "enough",
	 "entrys" => "entries",
	 "enviroment" => "environment",
	 "equiped" => "equipped",
	 "errror" => "error",
         "errorous" => "erroneous",
	 "Evalute" => "Evaluate",
	 "everytime" => "every time",
         "eample" => "example",
         "exapmle" => "example",
	 "execess" => "excess",
	 "exection" => "execution",
	 "existance" => "existence",
	 "explicitely" => "explicitly",
	 "explicity" => "explicitly",
	 "extented" => "extended",
	 "extention" => "extension",
	 "extentions" => "extensions",
	 "Extention" => "Extension",
	 "favour" => "favor",
	 "favourite" => "favorite",
	 "firware" => "firmware",
	 "foward" => "forward",
	 "fucntion" => "function",
	 "fuction" => "function",
	 "fuctions" => "functions",
	 "fulfilling" => "fulfiling",
	 "funcion" => "function",
	 "funciton" => "function",
	 "functin" => "function",
	 "funtion" => "function",
         "funtional" => "functional",
	 "funtions" => "functions",
	 "furthur" => "further",
         "gernerated" => "generated",
	 "guarenteed" => "guaranteed",
	 "handeling" => "handling",
	 "harware" => "hardware",
	 "hasnt" => "hasn't",
	 "havn't" => "haven't",
         "heigt" => "height",
         "heigth" => "height",
         "hiddden" => "hidden",
	 "honour" => "honor",
	 "honours" => "honors",
	 "i'm" => "I'm",
	 "indentical" => "identical",
	 "immediatly" => "immediately",
	 "implemantation" => "implementation",
	 "implemenation" => "implementation",
	 "implimention" => "implementation",
	 "implmentation" => "implementation",
	 "Incomming" => "Incoming",
	 "incomming" => "incoming",
	 "independend" => "independent",
	 "indice" => "index",
	 "indeces" => "indices",
	 "Inifity" => "Infinity",
	 "infomation" => "information",
	 "informatation" => "information",
	 "inital" => "initial",
         "initalized" => "initialized",
	 "initalization" => "initialization",
	 "initilization" => "initialization",
	 "intialisation" => "initialization",
	 "intialization" => "initialization",
	 "Initalize" => "Initialize",
	 "initalize" => "initialize",
	 "Initialyze" => "Initialize",
	 "Initilialyze" => "Initialize",
	 "Initilize" => "Initialize",
	 "initilize" => "initialize",
	 "intiailize" => "initialize",
	 "Intialize" => "Initialize",
	 "intialize" => "initialize",
	 "isntance" => "instance",
	 "intruction" => "instruction",
	 "inteface" => "interface",
         "interisting", "interesting",
	 "interrrupt" => "interrupt",
	 "Interupt" => "Interrupt",
	 "intrrupt" => "interrupt",
	 "interrups" => "interrupts",
	 "intervall" => "interval",
         "introdutionary" => "introductionary",
	 "invarient" => "invariant",
	 "invokation" => "invocation",
	 "is'nt" => "isn't",
	 "issueing" => "issuing",
	 "judgement" => "judgment",
	 "labelling" => "labeling",
	 "learnt" => "learned",
	 "Lenght" => "Length",
	 "Licens" => "License",
         "licence" => "license",
	 "Licence" => "License",
	 "Licenced" => "Licensed",
	 "losely" => "loosely",
	 "managment" => "management",
	 "manangement" => "management",
	 "millimetres" => "millimeters",
	 "miscellaneaous" => "miscellaneous",
         "mispelled" => "misspelled",
	 "modelling" => "modeling",
	 "Modelling" => "Modeling",
	 "mulitple" => "multiple",
	 "mistery" => "mystery",
         "neccesary" => "necessary",
	 "neccessary" => "necessary",
	 "necessery" => "necessary",
         "nessecarry" => "necessary",
	 "negativ" => "negative",
	 "negociated" => "negotiated",
	 "negociation" => "negotiation",
	 "neogtiation" => "negotiation",
	 "neighbours" => "neighbors",
	 "neighbourhood" => "neighborhood",
	 "Noone" => "No-one",
	 "nonexistant" => "nonexistent",
	 "noticable" => "noticeable",
	 "occured" => "occurred",
	 "occurance" => "occurrence",
	 "occurrance" => "occurrence",
	 "occurrances" => "occurrences",
	 "occurence" => "occurrence",
	 "occurences" => "occurrences",
	 "occurances" => "occurrences",
	 "occuring" => "occurring",
	 "organise" => "organize",
	 "organiser" => "organizer",
	 "organisation" => "organization",
	 "organisations" => "organizations",
	 "Organisation" => "Organization",
	 "organisational" => "organizational",
	 "orignal" => "original",
	 "Originaly" => "Originally",
         "opend" => "opened",
	 "ouput" => "output",
	 "outputing" => "outputting",
	 "overidden" => "overridden",
	 "overriden" => "overridden",
	 "paramter" => "parameter",
	 "paramaters" => "parameters",
	 "parametres" => "parameters",
	 "paramters" => "parameters",
	 "paticular" => "particular",
	 "particularily" => "particularly",
	 "Pendings" => "Pending",
	 "Perfomance" => "Performance",
	 "performace" => "performance",
	 "preformance" => "performance",
	 "Periferial" => "Peripheral",
	 "permissable" => "permissible",
	 "hysical" => "physical",
	 "phyiscal" => "physical",
         "politness" => "politeness",
         "posssibility" => "possibility",
         "posibility" => "possibility",
	 "potentally" => "potentially",
	 "preceeded" => "preceded",
	 "preceeding" => "preceding",
	 "preemphasised" => "preemphasized",
	 "Preemphasised" => "Preemphasized",
         "prefered" => "preferred",
         "Prefered" => "Preferred",
	 "presense" => "presence",
	 "priviledge" => "privilege",
         "probatility" => "probability",
	 "problmes" => "problems",
         "proceedure" => "procedure",
	 "programme" => "program",
	 "promiscous" => "promiscuous",
	 "Propogate" => "Propagate",
	 "protoypes" => "prototypes",
	 "Psuedo" => "Pseudo",
	 "psuedo" => "pseudo",
         "purposees" => "purposes",
	 "queing" => "queuing",
	 "realise" => "realize",
	 "realy" => "really",
	 "reasonnable" => "reasonable",
	 "resonable" => "reasonable",
	 "recevie" => "receive",
	 "Recieve" => "Receive",
	 "Recieves" => "Receives",
	 "recieve" => "receive",
         "recives" => "receives",
	 "recieves" => "receives",
	 "recieved" => "received",
	 "receving" => "receiving",
	 "recognise" => "recognize",
         "recomended" => "recommended",
	 "refered" => "referred",
         "Refeshes" => "Refreshes",
	 "regarless" => "regardless",
	 "Regsiter" => "Register",
	 "Reigster" => "Register",
	 "registred" => "registered",
	 "registaration" => "registration",
         "reimplemenations" => "reimplementations",
         "Reimplemenations" => "Reimplementations",
	 "releated" => "related",
	 "relevent" => "relevant",
         "relocateable" => "relocatable",
	 "remaing" => "remaining",
	 "remeber" => "remember",
	 "remebers" => "remembers",
	 "renewd" => "renewed",
         "replys" => "replies",
	 "requeusts" => "requests",
	 "relection" => "reselection",
	 "resetted" => "reset",
	 "ressources" => "resources",
	 "responsability" => "responsibility",
	 "retreive" => "retrieve",
	 "retreived" => "retrieved",
	 "savely" => "safely",
	 "saftey" => "safety",
         "seperator" => "separator",
	 "smaple" => "sample",
	 "scather" => "scatter",
	 "scenerio" => "scenario",
	 "sceptical" => "skeptical",
	 "Seperate" => "Separate",
	 "Shouldnt" => "Shouldn't",
	 "shouldnt" => "shouldn't",
	 "Similarily" => "Similarly",
         "Sombody" => "Somebody",
         "seperated" => "separated",
         "seperation" => "separation",
	 "specfic" => "specific",
	 "specifc" => "specific",
	 "Specificiation" => "Specification",
	 "specifed" => "specified",
	 "speficied" => "specified",
	 "specifiy" => "specify",
	 "specifing" => "specifying",
         "speling" => "spelling",
	 "straighforward" => "straightforward",
	 "stuctures" => "structures",
         "subcribed" => "subscribed",
	 "succeded" => "succeeded",
	 "sucess" => "success",
	 "succesful" => "successful",
         "sucessfull" => "successful",
	 "successfull" => "successful",
	 "sucessfully" => "successfully",
	 "succesfully" => "successfully",
	 "sucessfuly" => "successfully",
	 "sufficent" => "sufficient",
	 "superflous" => "superfluous",
	 "supress" => "suppress",
	 "swaped" => "swapped",
	 "synchronyze" => "synchronize",
         "synchronise" => "synchronize",
         "syncrounous" => "syncronous",
	 "syncronizing" => "synchronizing",
	 "syncronous" => "synchronous",
	 "threshhold" => "threshold",
         "threshholds" => "thresholds",
	 "throught" => "through",
	 "throuth" => "through",
	 "timming" => "timing",
	 "transation" => "transaction",
	 "tranceiver" => "transceiver",
	 "trasfered" => "transferred",
	 "transfering" => "transferring",
	 "tranlation" => "translation",
	 "transmition" => "transmission",
	 "transmittion" => "transmission",
	 "transmiter" => "transmitter",
	 "transmiting" => "transmitting",
	 "travelling" => "traveling",
	 "tiggered" => "triggered",
	 "triggerred" => "triggered",
	 "triggerg" => "triggering",
	 "truely" => "truly",
         "trys" => "tries",
	 "uglyness" => "ugliness",
         "unneccessay" => "unnecessary",
	 "unneccessary" => "unnecessary",
	 "underrrun" => "underrun",
	 "undesireable" => "undesirable",
	 "Undexpected" => "Unexpected",
	 "Unfortunatly" => "Unfortunately",
	 "unfortunatly" => "unfortunately",
	 "unitialized" => "uninitialized",
         "unsuccesful" => "unsuccessful",
         "unusuable" => "unusable",
	 "unkown" => "unknown",
	 "usuable" => "usable",
	 "usefull" => "useful",
	 "verfication" => "verification",
	 "verticies" => "vertices",
         "vicitim" => "victim",
	 "waranty" => "warranty",
	 "watseful" => "wasteful",
         "wich" => "which",
	 "wierd" => "weird",
	 "Writting" => "Writing",
	 "writting" => "writing",
         "yeld" => "yield"
         );

sub spell_file($)
{
    my ($f) = @_;
    my $firsttime = 1;

    if(open(IN, "<$f")) {
        my @c = <IN>;

        my $matches = 0;
        foreach $line (@c) {
            my @words = split /\W/, $line;
            foreach $w (@words) {
                if(defined($fix{$w})) {
                    $matches++;
                    $line =~ s/\b$w\b/$fix{$w}/g;
                }
            }
            foreach $w (keys %fix) {
                if ($line =~ /$w/ and $line !~ /$fix{$w}/) {
                    if ($firsttime) {
                        print "spelling $f\n";
                        $firsttime = 0;
                    }
                    print "nonword misspelling: $w\n";
                }
            }
        }
        close (IN);
        if($matches) {
            open (O, ">$f");
            print O @c;
            close(O);
        }
    }
}

@dirqueue = ();

sub processDir($)
{
    my ($d) = @_;
    my $e;

    print "processDir: $d\n";

    opendir (DIR, "$d") || die "couldn't read dir: $d";
    while ($e = readdir(DIR)) {
        next if ($e eq ".");
        next if ($e eq "..");
        next if ($e eq "CVS");
        next if ($e =~ /\.desktop$/);
        push (@dirqueue, "$d/$e") if (-d ("$d/$e"));
        next if (-d ("$d/$e"));

        my $type = `file $d/$e`;
        if ($type !~ /(text|ASCII)/i) {
            print "** Skipping $d/$e\n";
            next;
        }
        &spell_file("$d/$e") if (-f ("$d/$e"));
    }
    closedir(DIR);
}

push (@dirqueue, getcwd());

while($#dirqueue >= 0) {
    processDir( pop @dirqueue );
}

