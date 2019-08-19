#!/bin/usr/perl
use v5.010;
use warnings;
my $LOOP = 1;
#This opens the phonebook.txt file and stores every line into an array.
open(INPUT, 'phonebook.txt');
my @lines = <INPUT>;
close(INPUT);
sub match {
    #Upon matching, this will format the element in the array that was matched into a readable format.
    my $p1 = $_[0];
    @RECORD = split(':', $lines[$p1]);
    say "Name is: " . $RECORD[0];
    say "Home Phone number is: " . $RECORD[1];
    say "Mobile Phone number is: " . $RECORD[2];
    say "Address is: " . $RECORD[3];
    say "Birthday is: " . $RECORD[4];
    say "Salary is: \$" . $RECORD[5];
}
until ($LOOP == 0) {
    #Print the menu.
    say "(1) List records in alphabetical order.";
    say "(2) List records in reverse alphabetical order.";
    say "(3) Search records by last name.";
    say "(4) Search records by birthday.";
    say "(5) Exit.";
    my $MENU1_INPUT = <STDIN>;
    chomp $MENU1_INPUT;
    if ($MENU1_INPUT eq "1") {
	print `cat phonebook.txt | sort -n`;
    } elsif ($MENU1_INPUT eq "2") {
	print `cat phonebook.txt | sort -nr`;
    } elsif ($MENU1_INPUT eq "3") {
	my $LOOP2 = 1;
        while ($LOOP2 == 1) {
	    say "Searching. Please input a last name.";
	    my $SEARCH_INPUT = <STDIN>;
	    chomp $SEARCH_INPUT;
	    #If the user inputs nothing or just whitespace, this will trigger.
	    if ($SEARCH_INPUT =~ /^ *$/) {
	        say "Please input a proper last name.";
		next;
	    }
	    #NOM stands for number of matches in the case that a search gives two or more results.
	    my $NOM = 0;
	    for $i (0..$#lines) {
		chomp $lines[$i];
		#This will test the regex if it matches at the particular spot in the input file.
		if ($lines[$i] =~ m/\b.*\b $SEARCH_INPUT:[0-9]{3}/g) {
		    match($i);
		    $NOM++;
		}
	    }
	    if ($NOM == 0) {
		say "No matches. Would you like to try again? [ Y | N ]";
		my $ANS = <STDIN>;
		chomp $ANS;
		if ($ANS eq "Y") {
		    next;
		} elsif ($ANS eq "N") {
		    
		} else {
		    say "Please select an option. [ Y | N ]";
	        }
	    }
	    $LOOP2--;
	}
    } elsif ($MENU1_INPUT eq "4") {
	my $NOM = 0;
	my $LOOP3 = 1;
	say "Please select an input format.";
	while ($LOOP3 == 1) {
	    say "(1) MM/DD/YY";
	    say "(2) MM";
            say "(3) YY";
	    my $MENU2_INPUT = <STDIN>;
	    chomp $MENU2_INPUT;
	    if ($MENU2_INPUT eq "1") {
		say "Please enter the date.";
		my $SEARCH2_INPUT = <STDIN>;
		chomp $SEARCH2_INPUT;
		for $i (0..$#lines) {
		    chomp $lines[$i];
                    if ($lines[$i] =~ m/:$SEARCH2_INPUT:/g) {
                        match($i);
                        $NOM++;
                    }
	        }
		if ($NOM == 0) {
                    say "No matches. Would you like to try again? [ Y | N ]";
                    my $ANS = <STDIN>;
                    chomp $ANS;
                    if ($ANS eq "Y") {
                        next;
                    } elsif ($ANS eq "N") {

                    } else {
                        say "Please select an option. [ Y | N ]";
		    }
		}
	    } elsif ($MENU2_INPUT eq "2") {
		say "Please enter the month.";
                my $SEARCH2_INPUT = <STDIN>;
		chomp $SEARCH2_INPUT;
		for my $i (0..$#lines) {
		    chomp $lines[$i];
                    if ($lines[$i] =~ m/:$SEARCH2_INPUT\/[0-9]*\/[0-9]*:/g) {
			match($i);
			$NOM++;
                    }
                }
                if ($NOM == 0) {
                    say "No matches. Would you like to try again? [ Y | N ]";
                    my $ANS = <STDIN>;
                    chomp $ANS;
                    if ($ANS eq "Y") {
                        next;
                    } elsif ($ANS eq "N") {

                    } else {
                        say "Please select an option. [ Y | N ]";
                    }
                }
	    } elsif ($MENU2_INPUT eq "3") {
                say "Please enter the last two digits of the year.";
                my $SEARCH2_INPUT = <STDIN>;
		chomp $SEARCH2_INPUT;
		for $i (0..$#lines) {
                chomp $lines[$i];
                    if ($lines[$i] =~ m/:[0-9]*\/[0-9]*\/$SEARCH2_INPUT:/g) {
                        match($i);
			$NOM++;
                    }
                }
                if ($NOM == 0) {
                    say "No matches. Would you like to try again? [ Y | N ]";
                    my $ANS = <STDIN>;
                    chomp $ANS;
                    if ($ANS eq "Y") {
                        next;
                    } elsif ($ANS eq "N") {

                    } else {
                        say "Please select an option. [ Y | N ]";
                    }
                }

	    } else {
		say "Please select a proper format.";
		next;
	    }
	    $LOOP3--;
	}
    } elsif ($MENU1_INPUT eq "5") {
	#This will exit out of the loop.
	$LOOP--;
    } else {
	say "Please select a proper option.";
    }
}
