wget_sized
==========

This script:

1. starts wget
2. waits until wget discovers the size of the file from the server
3. uses dd to resize the file to that size
4. lets wget finish retrieving the file

Reason
------

The reason for this script was so that I could stream a file from my server while the server was still downloading it.   To stream the file it requires that the server report the full file size.  The issue with wget by itself is that it doesn't initialize the size of the file before it starts downloading, instead the file size increases _as_ it is downloading.  This script fixes that.