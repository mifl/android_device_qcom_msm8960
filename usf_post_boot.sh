#!/system/bin/sh
# Copyright (c) 2011, Code Aurora Forum. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
#     * Neither the name of Code Aurora Forum, Inc. nor the names of its
#       contributors may be used to endorse or promote products derived
#       from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
# ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#

trigger_file=/data/usf/form_factor.cfg

if [ ! -e $trigger_file ]; then
    # Configurations select upon the current platform
    platform=`cat /sys/devices/system/soc/soc0/hw_platform`

    case $platform in
        "Liquid")
            ln -s /data/usf/form_factor_liquid.cfg /data/usf/form_factor.cfg
            ln -s /data/usf/tester/cfg_liquid /data/usf/tester/cfg
            ln -s /data/usf/epos/cfg_liquid /data/usf/epos/cfg
            ln -s /data/usf/hovering/cfg_liquid /data/usf/hovering/cfg
            ln -s /data/usf/p2p/cfg_liquid /data/usf/p2p/cfg
            ln -s /data/usf/gesture/cfg_liquid /data/usf/gesture/cfg
        ;;
        "Fluid")
            ln -s /data/usf/form_factor_fluid.cfg /data/usf/form_factor.cfg
            ln -s /data/usf/tester/cfg_fluid /data/usf/tester/cfg
            ln -s /data/usf/epos/cfg_fluid /data/usf/epos/cfg
            ln -s /data/usf/hovering/cfg_fluid /data/usf/hovering/cfg
            ln -s /data/usf/p2p/cfg_fluid /data/usf/p2p/cfg
            ln -s /data/usf/gesture/cfg_fluid /data/usf/gesture/cfg
        ;;
    esac

   # The USF based calculators have system permissions
   chown system /data/usf/*
   chown system /data/usf/*/*
   chown system /data/usf/*/*/*
fi

chown system /dev/usf1

# Post-boot start of selected USF based calculators
for i in $(cat /data/usf/auto_start.txt); do
    start $i
done
