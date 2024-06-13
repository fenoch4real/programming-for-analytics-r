#########################################################################
# Memory Management in R
# Objective: Learn how to manage memory usage by R
#########################################################################

# An Overview of Memory Management in R - Why is this sometimes a problem?
# Simply put, R is not very efficient in its use of memory. 
# Although this inefficiency occurs on both x32- and x64-bit CPUs, 
# it is really only of concern in older x32-bit CPUs with <4GB RAM. 
# Newer x64-bit with larger RAM rarely encounter processing that exceeds 
# the amount of available RAM on a personal CPU. Nonetheless, you will, 
# on occasion, be running some sort of R code and suddenly the error message

# Cannot allocate vector of size ……appears, indicating a possible memory shortage issue. In short, R is telling
# you it cannot find sufficient memory to complete the analysis.

# Determining Your Memory Limits in R
# RAM is capped at ~3.5GB in x32 Windows systems, 
# and at the RAM installed in x64 Windows (W7/W8/W10) / MAC OS / Linux-build CPUs

# Two calls, memory.limit() and memory.size() return the amount of RAM in your CPU, 
# and how much is being used by your current R session, respectively. 
# memory.size() will grow as your R session progresses.

# memory management fxns
memory.limit()  # how much do you have?

memory.size()   # how much is being used?

# The first return (in kb) indicates the ~64GB available in my office CPU, 
# while the second shows usage on the order of ~30 something kb (yours will differ a bit).
# Note that not all RAM is truly available for R; your CPU OS uses a substantial portion
# of RAM as well for basic background OS operations, as well as other programs you may be running.

# Managing Memory Limits in R
# Your options for dealing with RAM revolve around two basic calls that clear your 
# workspace, rm() and gc(). rm(NameofObject) deletes objects - permanently. 
# Once they are removed they cannot be recovered except by re-running the code that 
# created the object in the first place. You forget this piece of advice at your own 
# peril. Multiple objects can be removed by separating them with a “,” (comma).

# cleaning up workspace; start by creating some simple objects
x <- 1  # object x; x is assigned value of 1
y <- 2  # object y; y is assigned value of 2
z <- 3  # object z; z is assigned value of 3
ls()    # what's in workspace?

rm(x)  # rm object x

ls()  # what's in workspace now?

rm(y, z)  # rm objects y,z

ls()  # what's in workspace now?  none of x, y, and z


# gc() releases memory, freeing it up to used once again. This is in contrast to rm(),
# which merely removes the object but does not release the memory to which the object 
# was attached. These commands are also applicable to CPUs with larger available RAM.

# Garbage Collection: "free up" previously used memory
gc()  # garbage clean-up - frees all memory

# Systematic memory issues (i.e., x32 RAM) more difficult to resolve. 
# Package bigmemory and those it references can be useful for memory management 
# x32 CPUs

# Exercise 4. Determine the memory size and limits on your personal CPU. 
# Run the code below line by line - accept as is, not what it does or 
# how it works - and see how memory usage changes

# observe how memory changes
memory.size()     # current memory occupied
a1 <- c(1:1e+08); memory.size()   # take lots of memory w/object
a2 <- a1 * 2      # take even more ...
memory.size()     # how much memory used now?
rm(a1, a2)        # rm objects a1,a2
memory.size()     # how much memory used now?
gc()              # clean up memory
memory.size()     # how much memory now?
?gc()
