lappend auto_path [file join [pwd] "tcl/rclass"]

package require rclass 1.0
package require rclass_network 1.0

# ms is a class singleton
# call top.rseed_interface.ms.get_instance()

# need to run to end of time zero to initialize everything
run 0

# setup the trigger to evaluate on - run 0 to finish off anything still processing
stop -quiet -change {top.rseed_interface.trigger} -command {run 0; rclass::eval_loop; run;} -continue
stop -quiet -change {top.rseed_interface.final_report} -command {run 0; rclass::final_report; run;} -continue

# add logging
# dump -add top -depth 0 -aggregates

# start main function
rclass::main
# run

puts "INFO STATUS : TCL : DONE"