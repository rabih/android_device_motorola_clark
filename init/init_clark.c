/*
   Copyright (c) 2014, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#include "init_msm.h"

void init_msm_properties(unsigned long msm_id, unsigned long msm_ver, char *board_type)
{
    char platform[PROP_VALUE_MAX];
    char sku[PROP_VALUE_MAX];
    char device[PROP_VALUE_MAX];
    char devicename[PROP_VALUE_MAX];
    FILE *fp;
    int rc;

    UNUSED(msm_id);
    UNUSED(msm_ver);
    UNUSED(board_type);

    rc = property_get("ro.board.platform", platform);
    if (!rc || !ISMATCH(platform, ANDROID_TARGET))
        return;

    property_get("ro.boot.hardware.sku", sku);

    property_set("ro.product.model", "XT1575");
    property_set("ro.telephony.default_network", "10");

    if (ISMATCH(sku, "XT1575")) {
        /* XT1540 */
        property_set("ro.product.name", "clark_retus");
        property_set("ro.product.device", "clark");
        property_set("ro.build.description", "clark_retus-user 5.1.1 LPH23.116-18 18 release-keys");
        property_set("ro.build.fingerprint", "motorola/clark_retus/clark:5.1.1/LPH23.116-18/18:user/release-keys");
        property_set("ro.build.product", "clark");
        property_set("gsm.sim.operator.numeric", "310410");
        property_set("persist.radio.mode_pref_nv10", "1");
        property_set("persist.radio.0x9e_not_callname", "1");
        property_set("ril.subscription.types", "RUIM");
        property_set("ro.mot.ignore_csim_appid", "true");
        property_set("ro.ril.svlte1x", "false");
        property_set("ro.ril.svdo", "false");
        property_set("telephony.lteOnCdmaDevice", "1");
    }

    property_get("ro.product.device", device);
    strlcpy(devicename, device, sizeof(devicename));
    INFO("Found sku id: %s setting build properties for %s device\n", sku, devicename);
}

void setMsim()
{
    property_set("persist.radio.force_get_pref", "1");
    property_set("persist.radio.multisim.config", "dsds");
}

