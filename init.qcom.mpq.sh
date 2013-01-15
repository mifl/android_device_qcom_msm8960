#!/system/bin/sh
# Copyright (c) 2009-2012, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# Set up the basic gpio configuration specific to MPQ
# Previously this was done in init.qcom.post_boot.sh
soc_id=`cat /sys/devices/system/soc/soc0/id`
   case "$soc_id" in
      "130")
         echo 230 > /sys/class/gpio/export
         echo 228 > /sys/class/gpio/export
         echo 229 > /sys/class/gpio/export
         echo "in" > /sys/class/gpio/gpio230/direction
         echo "rising" > /sys/class/gpio/gpio230/edge
         echo "in" > /sys/class/gpio/gpio228/direction
         echo "rising" > /sys/class/gpio/gpio228/edge
         echo "in" > /sys/class/gpio/gpio229/direction
         echo "rising" > /sys/class/gpio/gpio229/edge
         echo 253 > /sys/class/gpio/export
         echo 254 > /sys/class/gpio/export
         echo 257 > /sys/class/gpio/export
         echo 258 > /sys/class/gpio/export
         echo 259 > /sys/class/gpio/export
         echo "out" > /sys/class/gpio/gpio253/direction
         echo "out" > /sys/class/gpio/gpio254/direction
         echo "out" > /sys/class/gpio/gpio257/direction
         echo "out" > /sys/class/gpio/gpio258/direction
         echo "out" > /sys/class/gpio/gpio259/direction
         chown media /sys/class/gpio/gpio253/value
         chown media /sys/class/gpio/gpio254/value
         chown media /sys/class/gpio/gpio257/value
         chown media /sys/class/gpio/gpio258/value
         chown media /sys/class/gpio/gpio259/value
         chown media /sys/class/gpio/gpio253/direction
         chown media /sys/class/gpio/gpio254/direction
         chown media /sys/class/gpio/gpio257/direction
         chown media /sys/class/gpio/gpio258/direction
         chown media /sys/class/gpio/gpio259/direction
         echo 0 > /sys/module/rpm_resources/enable_low_power/vdd_dig
         echo 0 > /sys/module/rpm_resources/enable_low_power/vdd_mem
         start mpq_standby_app
         ;;
   esac
