#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#----------------------------------------------------------------------
# Compile (L)ittle (K)ernel bootloader
#----------------------------------------------------------------------
ifneq ($(strip $(TARGET_NO_BOOTLOADER)),true)

# Compile
include bootable/bootloader/lk/AndroidBoot.mk

$(INSTALLED_BOOTLOADER_MODULE): $(TARGET_EMMC_BOOTLOADER) | $(ACP)
	$(transform-prebuilt-to-target)
$(BUILT_TARGET_FILES_PACKAGE): $(INSTALLED_BOOTLOADER_MODULE)

droidcore: $(INSTALLED_BOOTLOADER_MODULE)
endif

#----------------------------------------------------------------------
# Compile Linux Kernel
#----------------------------------------------------------------------
ifeq ($(KERNEL_DEFCONFIG),)
	KERNEL_DEFCONFIG := full_msm8960-perf_defconfig
endif

include kernel/AndroidKernel.mk

$(INSTALLED_KERNEL_TARGET): $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

include device/qcom/common/generate_extra_images.mk

