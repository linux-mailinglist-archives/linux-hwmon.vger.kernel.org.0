Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCA4916FFCE
	for <lists+linux-hwmon@lfdr.de>; Wed, 26 Feb 2020 14:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgBZNV2 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 26 Feb 2020 08:21:28 -0500
Received: from mga02.intel.com ([134.134.136.20]:17462 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726277AbgBZNV2 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Feb 2020 08:21:28 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Feb 2020 05:21:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,488,1574150400"; 
   d="scan'208";a="410603466"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 26 Feb 2020 05:21:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id BA74044B; Wed, 26 Feb 2020 15:21:22 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Martin Volf <martin.volf.42@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] i2c: i801: Do not add ICH_RES_IO_SMI for the iTCO_wdt device
Date:   Wed, 26 Feb 2020 16:21:22 +0300
Message-Id: <20200226132122.62805-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226132122.62805-1-mika.westerberg@linux.intel.com>
References: <20200226132122.62805-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Martin noticed that nct6775 driver does not load properly on his system
in v5.4+ kernels. The issue was bisected to commit b84398d6d7f9 ("i2c:
i801: Use iTCO version 6 in Cannon Lake PCH and beyond") but it is
likely not the culprit because the faulty code has been in the driver
already since commit 9424693035a5 ("i2c: i801: Create iTCO device on
newer Intel PCHs"). So more likely some commit that added PCI IDs of
recent chipsets made the driver to create the iTCO_wdt device on Martins
system.

The issue was debugged to be PCI configuration access to the PMC device
that is not present. This returns all 1's when read and this caused the
iTCO_wdt driver to accidentally request resourses used by nct6775.

It turns out that the SMI resource is only required for some ancient
systems, not the ones supported by this driver. For this reason do not
populate the SMI resource at all and drop all the related code. The
driver now always populates the main I/O resource and only in case of SPT
(Intel Sunrisepoint) compatible devices it adds another resource for the
NO_REBOOT bit. These two resources are of different types so
platform_get_resource() used by the iTCO_wdt driver continues to find
the both resources at index 0.

Link: https://lore.kernel.org/linux-hwmon/CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com/
Fixes: 9424693035a5 ("i2c: i801: Create iTCO device on newer Intel PCHs")
Reported-by: Martin Volf <martin.volf.42@gmail.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/i2c/busses/i2c-i801.c | 45 ++++++++++-------------------------
 1 file changed, 12 insertions(+), 33 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ca4f096fef74..a9c03f5c3482 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -132,11 +132,6 @@
 #define TCOBASE		0x050
 #define TCOCTL		0x054
 
-#define ACPIBASE		0x040
-#define ACPIBASE_SMI_OFF	0x030
-#define ACPICTRL		0x044
-#define ACPICTRL_EN		0x080
-
 #define SBREG_BAR		0x10
 #define SBREG_SMBCTRL		0xc6000c
 #define SBREG_SMBCTRL_DNV	0xcf000c
@@ -1553,7 +1548,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 		pci_bus_write_config_byte(pci_dev->bus, devfn, 0xe1, hidden);
 	spin_unlock(&p2sb_spinlock);
 
-	res = &tco_res[ICH_RES_MEM_OFF];
+	res = &tco_res[1];
 	if (pci_dev->device == PCI_DEVICE_ID_INTEL_DNV_SMBUS)
 		res->start = (resource_size_t)base64_addr + SBREG_SMBCTRL_DNV;
 	else
@@ -1563,7 +1558,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 	res->flags = IORESOURCE_MEM;
 
 	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
-					tco_res, 3, &spt_tco_platform_data,
+					tco_res, 2, &spt_tco_platform_data,
 					sizeof(spt_tco_platform_data));
 }
 
@@ -1576,17 +1571,16 @@ static struct platform_device *
 i801_add_tco_cnl(struct i801_priv *priv, struct pci_dev *pci_dev,
 		 struct resource *tco_res)
 {
-	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
-					tco_res, 2, &cnl_tco_platform_data,
-					sizeof(cnl_tco_platform_data));
+	return platform_device_register_resndata(&pci_dev->dev,
+			"iTCO_wdt", -1, tco_res, 1, &cnl_tco_platform_data,
+			sizeof(cnl_tco_platform_data));
 }
 
 static void i801_add_tco(struct i801_priv *priv)
 {
-	u32 base_addr, tco_base, tco_ctl, ctrl_val;
 	struct pci_dev *pci_dev = priv->pci_dev;
-	struct resource tco_res[3], *res;
-	unsigned int devfn;
+	struct resource tco_res[2], *res;
+	u32 tco_base, tco_ctl;
 
 	/* If we have ACPI based watchdog use that instead */
 	if (acpi_has_watchdog())
@@ -1601,30 +1595,15 @@ static void i801_add_tco(struct i801_priv *priv)
 		return;
 
 	memset(tco_res, 0, sizeof(tco_res));
-
-	res = &tco_res[ICH_RES_IO_TCO];
-	res->start = tco_base & ~1;
-	res->end = res->start + 32 - 1;
-	res->flags = IORESOURCE_IO;
-
 	/*
-	 * Power Management registers.
+	 * Always populate the main iTCO IO resource here. The second entry
+	 * for NO_REBOOT MMIO is filled by the SPT specific function.
 	 */
-	devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 2);
-	pci_bus_read_config_dword(pci_dev->bus, devfn, ACPIBASE, &base_addr);
-
-	res = &tco_res[ICH_RES_IO_SMI];
-	res->start = (base_addr & ~1) + ACPIBASE_SMI_OFF;
-	res->end = res->start + 3;
+	res = &tco_res[0];
+	res->start = tco_base & ~1;
+	res->end = res->start + 32 - 1;
 	res->flags = IORESOURCE_IO;
 
-	/*
-	 * Enable the ACPI I/O space.
-	 */
-	pci_bus_read_config_dword(pci_dev->bus, devfn, ACPICTRL, &ctrl_val);
-	ctrl_val |= ACPICTRL_EN;
-	pci_bus_write_config_dword(pci_dev->bus, devfn, ACPICTRL, ctrl_val);
-
 	if (priv->features & FEATURE_TCO_CNL)
 		priv->tco_pdev = i801_add_tco_cnl(priv, pci_dev, tco_res);
 	else
-- 
2.25.0

