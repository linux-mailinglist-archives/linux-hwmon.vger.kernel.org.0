Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C78C13C6628
	for <lists+linux-hwmon@lfdr.de>; Tue, 13 Jul 2021 00:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhGLWOK (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 12 Jul 2021 18:14:10 -0400
Received: from mga03.intel.com ([134.134.136.65]:22584 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231252AbhGLWOK (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Jul 2021 18:14:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="210105427"
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; 
   d="scan'208";a="210105427"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 15:11:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; 
   d="scan'208";a="464407938"
Received: from jzloch-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.136.11])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 15:11:14 -0700
From:   Iwona Winiarska <iwona.winiarska@intel.com>
To:     linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Cc:     x86@kernel.org, devicetree@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Yazen Ghannam <yazen.ghannam@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Iwona Winiarska <iwona.winiarska@intel.com>
Subject: [PATCH 10/14] peci: Add peci-cpu driver
Date:   Tue, 13 Jul 2021 00:04:43 +0200
Message-Id: <20210712220447.957418-11-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712220447.957418-1-iwona.winiarska@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

PECI is an interface that may be used by different types of devices.
Here we're adding a peci-cpu driver compatible with Intel processors.
The driver is responsible for handling auxiliary devices that can
subsequently be used by other drivers (e.g. hwmons).

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 MAINTAINERS              |   1 +
 drivers/peci/Kconfig     |  15 ++
 drivers/peci/Makefile    |   2 +
 drivers/peci/cpu.c       | 347 +++++++++++++++++++++++++++++++++++++++
 drivers/peci/device.c    |   1 +
 drivers/peci/internal.h  |  27 +++
 drivers/peci/request.c   | 211 ++++++++++++++++++++++++
 include/linux/peci-cpu.h |  38 +++++
 include/linux/peci.h     |   8 -
 9 files changed, 642 insertions(+), 8 deletions(-)
 create mode 100644 drivers/peci/cpu.c
 create mode 100644 include/linux/peci-cpu.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ba874afa2fa..f47b5f634293 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14511,6 +14511,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/peci/
 F:	drivers/peci/
+F:	include/linux/peci-cpu.h
 F:	include/linux/peci.h
 
 PENSANDO ETHERNET DRIVERS
diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
index 27c31535843c..9e17e06fda90 100644
--- a/drivers/peci/Kconfig
+++ b/drivers/peci/Kconfig
@@ -16,6 +16,21 @@ menuconfig PECI
 
 if PECI
 
+config PECI_CPU
+	tristate "PECI CPU"
+	select AUXILIARY_BUS
+	help
+	  This option enables peci-cpu driver for Intel processors. It is
+	  responsible for creating auxiliary devices that can subsequently
+	  be used by other drivers in order to perform various
+	  functionalities such as e.g. temperature monitoring.
+
+	  Additional drivers must be enabled in order to use the functionality
+	  of the device.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called peci-cpu.
+
 source "drivers/peci/controller/Kconfig"
 
 endif # PECI
diff --git a/drivers/peci/Makefile b/drivers/peci/Makefile
index 917f689e147a..7de18137e738 100644
--- a/drivers/peci/Makefile
+++ b/drivers/peci/Makefile
@@ -3,6 +3,8 @@
 # Core functionality
 peci-y := core.o request.o device.o sysfs.o
 obj-$(CONFIG_PECI) += peci.o
+peci-cpu-y := cpu.o
+obj-$(CONFIG_PECI_CPU) += peci-cpu.o
 
 # Hardware specific bus drivers
 obj-y += controller/
diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
new file mode 100644
index 000000000000..8d130a9a71ad
--- /dev/null
+++ b/drivers/peci/cpu.c
@@ -0,0 +1,347 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2021 Intel Corporation
+
+#include <linux/auxiliary_bus.h>
+#include <linux/module.h>
+#include <linux/peci.h>
+#include <linux/peci-cpu.h>
+#include <linux/slab.h>
+#include <linux/x86/intel-family.h>
+
+#include "internal.h"
+
+/**
+ * peci_temp_read() - read the maximum die temperature from PECI target device
+ * @device: PECI device to which request is going to be sent
+ * @temp_raw: where to store the read temperature
+ *
+ * It uses GetTemp PECI command.
+ *
+ * Return: 0 if succeeded, other values in case errors.
+ */
+int peci_temp_read(struct peci_device *device, s16 *temp_raw)
+{
+	struct peci_request *req;
+
+	req = peci_get_temp(device);
+	if (IS_ERR(req))
+		return PTR_ERR(req);
+
+	*temp_raw = peci_request_data_temp(req);
+
+	peci_request_free(req);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(peci_temp_read, PECI_CPU);
+
+/**
+ * peci_pcs_read() - read PCS register
+ * @device: PECI device to which request is going to be sent
+ * @index: PCS index
+ * @param: PCS parameter
+ * @data: where to store the read data
+ *
+ * It uses RdPkgConfig PECI command.
+ *
+ * Return: 0 if succeeded, other values in case errors.
+ */
+int peci_pcs_read(struct peci_device *device, u8 index, u16 param, u32 *data)
+{
+	struct peci_request *req;
+	int ret;
+
+	req = peci_pkg_cfg_readl(device, index, param);
+	if (IS_ERR(req))
+		return PTR_ERR(req);
+
+	ret = peci_request_status(req);
+	if (ret)
+		goto out_req_free;
+
+	*data = peci_request_data_readl(req);
+out_req_free:
+	peci_request_free(req);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(peci_pcs_read, PECI_CPU);
+
+/**
+ * peci_pci_local_read() - read 32-bit memory location using raw address
+ * @device: PECI device to which request is going to be sent
+ * @bus: bus
+ * @dev: device
+ * @func: function
+ * @reg: register
+ * @data: where to store the read data
+ *
+ * It uses RdPCIConfigLocal PECI command.
+ *
+ * Return: 0 if succeeded, other values in case errors.
+ */
+int peci_pci_local_read(struct peci_device *device, u8 bus, u8 dev, u8 func,
+			u16 reg, u32 *data)
+{
+	struct peci_request *req;
+	int ret;
+
+	req = peci_pci_cfg_local_readl(device, bus, dev, func, reg);
+	if (IS_ERR(req))
+		return PTR_ERR(req);
+
+	ret = peci_request_status(req);
+	if (ret)
+		goto out_req_free;
+
+	*data = peci_request_data_readl(req);
+out_req_free:
+	peci_request_free(req);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(peci_pci_local_read, PECI_CPU);
+
+/**
+ * peci_ep_pci_local_read() - read 32-bit memory location using raw address
+ * @device: PECI device to which request is going to be sent
+ * @seg: PCI segment
+ * @bus: bus
+ * @dev: device
+ * @func: function
+ * @reg: register
+ * @data: where to store the read data
+ *
+ * Like &peci_pci_local_read, but it uses RdEndpointConfig PECI command.
+ *
+ * Return: 0 if succeeded, other values in case errors.
+ */
+int peci_ep_pci_local_read(struct peci_device *device, u8 seg,
+			   u8 bus, u8 dev, u8 func, u16 reg, u32 *data)
+{
+	struct peci_request *req;
+	int ret;
+
+	req = peci_ep_pci_cfg_local_readl(device, seg, bus, dev, func, reg);
+	if (IS_ERR(req))
+		return PTR_ERR(req);
+
+	ret = peci_request_status(req);
+	if (ret)
+		goto out_req_free;
+
+	*data = peci_request_data_readl(req);
+out_req_free:
+	peci_request_free(req);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(peci_ep_pci_local_read, PECI_CPU);
+
+/**
+ * peci_mmio_read() - read 32-bit memory location using 64-bit bar offset address
+ * @device: PECI device to which request is going to be sent
+ * @bar: PCI bar
+ * @seg: PCI segment
+ * @bus: bus
+ * @dev: device
+ * @func: function
+ * @address: 64-bit MMIO address
+ * @data: where to store the read data
+ *
+ * It uses RdEndpointConfig PECI command.
+ *
+ * Return: 0 if succeeded, other values in case errors.
+ */
+int peci_mmio_read(struct peci_device *device, u8 bar, u8 seg,
+		   u8 bus, u8 dev, u8 func, u64 address, u32 *data)
+{
+	struct peci_request *req;
+	int ret;
+
+	req = peci_ep_mmio64_readl(device, bar, seg, bus, dev, func, address);
+	if (IS_ERR(req))
+		return PTR_ERR(req);
+
+	ret = peci_request_status(req);
+	if (ret)
+		goto out_req_free;
+
+	*data = peci_request_data_readl(req);
+out_req_free:
+	peci_request_free(req);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(peci_mmio_read, PECI_CPU);
+
+struct peci_cpu {
+	struct peci_device *device;
+	const struct peci_device_id *id;
+	struct auxiliary_device **aux_devices;
+};
+
+static const char * const type[] = {
+	"cputemp",
+	"dimmtemp",
+};
+
+static void adev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	kfree(adev->name);
+	kfree(adev);
+}
+
+static struct auxiliary_device *add_adev(struct peci_cpu *priv, int idx)
+{
+	struct peci_controller *controller = priv->device->controller;
+	struct auxiliary_device *adev;
+	const char *name;
+	int ret;
+
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return ERR_PTR(-ENOMEM);
+
+	name = kasprintf(GFP_KERNEL, "%s.%s", type[idx], (const char *)priv->id->data);
+	if (!name) {
+		ret = -ENOMEM;
+		goto free_adev;
+	}
+
+	adev->name = name;
+	adev->dev.parent = &priv->device->dev;
+	adev->dev.release = adev_release;
+	adev->id = (controller->id << 16) | (priv->device->addr);
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		goto free_name;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ERR_PTR(ret);
+	}
+
+	return adev;
+
+free_name:
+	kfree(name);
+free_adev:
+	kfree(adev);
+	return ERR_PTR(ret);
+}
+
+static void del_adev(struct auxiliary_device *adev)
+{
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int peci_cpu_add_adevices(struct peci_cpu *priv)
+{
+	struct device *dev = &priv->device->dev;
+	struct auxiliary_device *adev;
+	int i;
+
+	priv->aux_devices = devm_kcalloc(dev, ARRAY_SIZE(type),
+					 sizeof(*priv->aux_devices),
+					 GFP_KERNEL);
+	if (!priv->aux_devices)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(type); i++) {
+		adev = add_adev(priv, i);
+		if (IS_ERR(adev)) {
+			dev_warn(dev, "Failed to add PECI auxiliary: %s, ret = %ld\n",
+				 type[i], PTR_ERR(adev));
+			continue;
+		}
+
+		priv->aux_devices[i] = adev;
+	}
+	return 0;
+}
+
+static int
+peci_cpu_probe(struct peci_device *device, const struct peci_device_id *id)
+{
+	struct device *dev = &device->dev;
+	struct peci_cpu *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, priv);
+	priv->device = device;
+	priv->id = id;
+
+	return peci_cpu_add_adevices(priv);
+}
+
+static void peci_cpu_remove(struct peci_device *device)
+{
+	struct peci_cpu *priv = dev_get_drvdata(&device->dev);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(type); i++) {
+		struct auxiliary_device *adev = priv->aux_devices[i];
+
+		if (adev)
+			del_adev(adev);
+	}
+}
+
+static const struct peci_device_id peci_cpu_device_ids[] = {
+	{ /* Haswell Xeon */
+		.family	= 6,
+		.model	= INTEL_FAM6_HASWELL_X,
+		.data	= "hsx",
+	},
+	{ /* Broadwell Xeon */
+		.family	= 6,
+		.model	= INTEL_FAM6_BROADWELL_X,
+		.data	= "bdx",
+	},
+	{ /* Broadwell Xeon D */
+		.family	= 6,
+		.model	= INTEL_FAM6_BROADWELL_D,
+		.data	= "skxd",
+	},
+	{ /* Skylake Xeon */
+		.family	= 6,
+		.model	= INTEL_FAM6_SKYLAKE_X,
+		.data	= "skx",
+	},
+	{ /* Icelake Xeon */
+		.family	= 6,
+		.model	= INTEL_FAM6_ICELAKE_X,
+		.data	= "icx",
+	},
+	{ /* Icelake Xeon D */
+		.family	= 6,
+		.model	= INTEL_FAM6_ICELAKE_D,
+		.data	= "icxd",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(peci, peci_cpu_device_ids);
+
+static struct peci_driver peci_cpu_driver = {
+	.probe		= peci_cpu_probe,
+	.remove		= peci_cpu_remove,
+	.id_table	= peci_cpu_device_ids,
+	.driver		= {
+		.name		= "peci-cpu",
+	},
+};
+module_peci_driver(peci_cpu_driver);
+
+MODULE_AUTHOR("Iwona Winiarska <iwona.winiarska@intel.com>");
+MODULE_DESCRIPTION("PECI CPU driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PECI);
diff --git a/drivers/peci/device.c b/drivers/peci/device.c
index 8c4bd1ebbc29..c278c9ea166c 100644
--- a/drivers/peci/device.c
+++ b/drivers/peci/device.c
@@ -3,6 +3,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/peci.h>
+#include <linux/peci-cpu.h>
 #include <linux/slab.h>
 #include <linux/x86/cpu.h>
 
diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
index c891c93e077a..1d39483a8acf 100644
--- a/drivers/peci/internal.h
+++ b/drivers/peci/internal.h
@@ -21,6 +21,7 @@ void peci_request_free(struct peci_request *req);
 
 int peci_request_status(struct peci_request *req);
 u64 peci_request_data_dib(struct peci_request *req);
+s16 peci_request_data_temp(struct peci_request *req);
 
 u8 peci_request_data_readb(struct peci_request *req);
 u16 peci_request_data_readw(struct peci_request *req);
@@ -35,6 +36,32 @@ struct peci_request *peci_pkg_cfg_readw(struct peci_device *device, u8 index, u1
 struct peci_request *peci_pkg_cfg_readl(struct peci_device *device, u8 index, u16 param);
 struct peci_request *peci_pkg_cfg_readq(struct peci_device *device, u8 index, u16 param);
 
+struct peci_request *peci_pci_cfg_local_readb(struct peci_device *device,
+					      u8 bus, u8 dev, u8 func, u16 reg);
+struct peci_request *peci_pci_cfg_local_readw(struct peci_device *device,
+					      u8 bus, u8 dev, u8 func, u16 reg);
+struct peci_request *peci_pci_cfg_local_readl(struct peci_device *device,
+					      u8 bus, u8 dev, u8 func, u16 reg);
+
+struct peci_request *peci_ep_pci_cfg_local_readb(struct peci_device *device, u8 seg,
+						 u8 bus, u8 dev, u8 func, u16 reg);
+struct peci_request *peci_ep_pci_cfg_local_readw(struct peci_device *device, u8 seg,
+						 u8 bus, u8 dev, u8 func, u16 reg);
+struct peci_request *peci_ep_pci_cfg_local_readl(struct peci_device *device, u8 seg,
+						 u8 bus, u8 dev, u8 func, u16 reg);
+
+struct peci_request *peci_ep_pci_cfg_readb(struct peci_device *device, u8 seg,
+					   u8 bus, u8 dev, u8 func, u16 reg);
+struct peci_request *peci_ep_pci_cfg_readw(struct peci_device *device, u8 seg,
+					   u8 bus, u8 dev, u8 func, u16 reg);
+struct peci_request *peci_ep_pci_cfg_readl(struct peci_device *device, u8 seg,
+					   u8 bus, u8 dev, u8 func, u16 reg);
+
+struct peci_request *peci_ep_mmio32_readl(struct peci_device *device, u8 bar, u8 seg,
+					  u8 bus, u8 dev, u8 func, u64 offset);
+
+struct peci_request *peci_ep_mmio64_readl(struct peci_device *device, u8 bar, u8 seg,
+					  u8 bus, u8 dev, u8 func, u64 offset);
 /**
  * struct peci_device_id - PECI device data to match
  * @data: pointer to driver private data specific to device
diff --git a/drivers/peci/request.c b/drivers/peci/request.c
index 48354455b554..c5d39f7e8142 100644
--- a/drivers/peci/request.c
+++ b/drivers/peci/request.c
@@ -3,6 +3,7 @@
 
 #include <linux/bug.h>
 #include <linux/export.h>
+#include <linux/pci.h>
 #include <linux/peci.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -15,6 +16,10 @@
 #define  PECI_GET_DIB_WR_LEN		1
 #define  PECI_GET_DIB_RD_LEN		8
 
+#define PECI_GET_TEMP_CMD		0x01
+#define  PECI_GET_TEMP_WR_LEN		1
+#define  PECI_GET_TEMP_RD_LEN		2
+
 #define PECI_RDPKGCFG_CMD		0xa1
 #define  PECI_RDPKGCFG_WRITE_LEN	5
 #define  PECI_RDPKGCFG_READ_LEN_BASE	1
@@ -22,6 +27,44 @@
 #define  PECI_WRPKGCFG_WRITE_LEN_BASE	6
 #define  PECI_WRPKGCFG_READ_LEN		1
 
+#define PECI_RDIAMSR_CMD		0xb1
+#define  PECI_RDIAMSR_WRITE_LEN		5
+#define  PECI_RDIAMSR_READ_LEN		9
+#define PECI_WRIAMSR_CMD		0xb5
+#define PECI_RDIAMSREX_CMD		0xd1
+#define  PECI_RDIAMSREX_WRITE_LEN	6
+#define  PECI_RDIAMSREX_READ_LEN	9
+
+#define PECI_RDPCICFG_CMD		0x61
+#define  PECI_RDPCICFG_WRITE_LEN	6
+#define  PECI_RDPCICFG_READ_LEN		5
+#define  PECI_RDPCICFG_READ_LEN_MAX	24
+#define PECI_WRPCICFG_CMD		0x65
+
+#define PECI_RDPCICFGLOCAL_CMD			0xe1
+#define  PECI_RDPCICFGLOCAL_WRITE_LEN		5
+#define  PECI_RDPCICFGLOCAL_READ_LEN_BASE	1
+#define PECI_WRPCICFGLOCAL_CMD			0xe5
+#define  PECI_WRPCICFGLOCAL_WRITE_LEN_BASE	6
+#define  PECI_WRPCICFGLOCAL_READ_LEN		1
+
+#define PECI_ENDPTCFG_TYPE_LOCAL_PCI		0x03
+#define PECI_ENDPTCFG_TYPE_PCI			0x04
+#define PECI_ENDPTCFG_TYPE_MMIO			0x05
+#define PECI_ENDPTCFG_ADDR_TYPE_PCI		0x04
+#define PECI_ENDPTCFG_ADDR_TYPE_MMIO_D		0x05
+#define PECI_ENDPTCFG_ADDR_TYPE_MMIO_Q		0x06
+#define PECI_RDENDPTCFG_CMD			0xc1
+#define  PECI_RDENDPTCFG_PCI_WRITE_LEN		12
+#define  PECI_RDENDPTCFG_MMIO_D_WRITE_LEN	14
+#define  PECI_RDENDPTCFG_MMIO_Q_WRITE_LEN	18
+#define  PECI_RDENDPTCFG_READ_LEN_BASE		1
+#define PECI_WRENDPTCFG_CMD			0xc5
+#define  PECI_WRENDPTCFG_PCI_WRITE_LEN_BASE	13
+#define  PECI_WRENDPTCFG_MMIO_D_WRITE_LEN_BASE	15
+#define  PECI_WRENDPTCFG_MMIO_Q_WRITE_LEN_BASE	19
+#define  PECI_WRENDPTCFG_READ_LEN		1
+
 /* Device Specific Completion Code (CC) Definition */
 #define PECI_CC_SUCCESS				0x40
 #define PECI_CC_NEED_RETRY			0x80
@@ -223,6 +266,27 @@ struct peci_request *peci_get_dib(struct peci_device *device)
 }
 EXPORT_SYMBOL_NS_GPL(peci_get_dib, PECI);
 
+struct peci_request *peci_get_temp(struct peci_device *device)
+{
+	struct peci_request *req;
+	int ret;
+
+	req = peci_request_alloc(device, PECI_GET_TEMP_WR_LEN, PECI_GET_TEMP_RD_LEN);
+	if (!req)
+		return ERR_PTR(-ENOMEM);
+
+	req->tx.buf[0] = PECI_GET_TEMP_CMD;
+
+	ret = peci_request_xfer(req);
+	if (ret) {
+		peci_request_free(req);
+		return ERR_PTR(ret);
+	}
+
+	return req;
+}
+EXPORT_SYMBOL_NS_GPL(peci_get_temp, PECI);
+
 static struct peci_request *
 __pkg_cfg_read(struct peci_device *device, u8 index, u16 param, u8 len)
 {
@@ -248,6 +312,108 @@ __pkg_cfg_read(struct peci_device *device, u8 index, u16 param, u8 len)
 	return req;
 }
 
+static u32 __get_pci_addr(u8 bus, u8 dev, u8 func, u16 reg)
+{
+	return reg | PCI_DEVID(bus, PCI_DEVFN(dev, func)) << 12;
+}
+
+static struct peci_request *
+__pci_cfg_local_read(struct peci_device *device, u8 bus, u8 dev, u8 func, u16 reg, u8 len)
+{
+	struct peci_request *req;
+	u32 pci_addr;
+	int ret;
+
+	req = peci_request_alloc(device, PECI_RDPCICFGLOCAL_WRITE_LEN,
+				 PECI_RDPCICFGLOCAL_READ_LEN_BASE + len);
+	if (!req)
+		return ERR_PTR(-ENOMEM);
+
+	pci_addr = __get_pci_addr(bus, dev, func, reg);
+
+	req->tx.buf[0] = PECI_RDPCICFGLOCAL_CMD;
+	req->tx.buf[1] = 0;
+	put_unaligned_le24(pci_addr, &req->tx.buf[2]);
+
+	ret = peci_request_xfer_retry(req);
+	if (ret) {
+		peci_request_free(req);
+		return ERR_PTR(ret);
+	}
+
+	return req;
+}
+
+static struct peci_request *
+__ep_pci_cfg_read(struct peci_device *device, u8 msg_type, u8 seg,
+		  u8 bus, u8 dev, u8 func, u16 reg, u8 len)
+{
+	struct peci_request *req;
+	u32 pci_addr;
+	int ret;
+
+	req = peci_request_alloc(device, PECI_RDENDPTCFG_PCI_WRITE_LEN,
+				 PECI_RDENDPTCFG_READ_LEN_BASE + len);
+	if (!req)
+		return ERR_PTR(-ENOMEM);
+
+	pci_addr = __get_pci_addr(bus, dev, func, reg);
+
+	req->tx.buf[0] = PECI_RDENDPTCFG_CMD;
+	req->tx.buf[1] = 0;
+	req->tx.buf[2] = msg_type;
+	req->tx.buf[3] = 0;
+	req->tx.buf[4] = 0;
+	req->tx.buf[5] = 0;
+	req->tx.buf[6] = PECI_ENDPTCFG_ADDR_TYPE_PCI;
+	req->tx.buf[7] = seg; /* PCI Segment */
+	put_unaligned_le32(pci_addr, &req->tx.buf[8]);
+
+	ret = peci_request_xfer_retry(req);
+	if (ret) {
+		peci_request_free(req);
+		return ERR_PTR(ret);
+	}
+
+	return req;
+}
+
+static struct peci_request *
+__ep_mmio_read(struct peci_device *device, u8 bar, u8 addr_type, u8 seg,
+	       u8 bus, u8 dev, u8 func, u64 offset, u8 tx_len, u8 len)
+{
+	struct peci_request *req;
+	int ret;
+
+	req = peci_request_alloc(device, tx_len, PECI_RDENDPTCFG_READ_LEN_BASE + len);
+	if (!req)
+		return ERR_PTR(-ENOMEM);
+
+	req->tx.buf[0] = PECI_RDENDPTCFG_CMD;
+	req->tx.buf[1] = 0;
+	req->tx.buf[2] = PECI_ENDPTCFG_TYPE_MMIO;
+	req->tx.buf[3] = 0; /* Endpoint ID */
+	req->tx.buf[4] = 0; /* Reserved */
+	req->tx.buf[5] = bar;
+	req->tx.buf[6] = addr_type;
+	req->tx.buf[7] = seg; /* PCI Segment */
+	req->tx.buf[8] = PCI_DEVFN(dev, func);
+	req->tx.buf[9] = bus; /* PCI Bus */
+
+	if (addr_type == PECI_ENDPTCFG_ADDR_TYPE_MMIO_D)
+		put_unaligned_le32(offset, &req->tx.buf[10]);
+	else
+		put_unaligned_le64(offset, &req->tx.buf[10]);
+
+	ret = peci_request_xfer_retry(req);
+	if (ret) {
+		peci_request_free(req);
+		return ERR_PTR(ret);
+	}
+
+	return req;
+}
+
 u8 peci_request_data_readb(struct peci_request *req)
 {
 	return req->rx.buf[1];
@@ -278,6 +444,12 @@ u64 peci_request_data_dib(struct peci_request *req)
 }
 EXPORT_SYMBOL_NS_GPL(peci_request_data_dib, PECI);
 
+s16 peci_request_data_temp(struct peci_request *req)
+{
+	return get_unaligned_le16(&req->rx.buf[0]);
+}
+EXPORT_SYMBOL_NS_GPL(peci_request_data_temp, PECI);
+
 #define __read_pkg_config(x, type) \
 struct peci_request *peci_pkg_cfg_##x(struct peci_device *device, u8 index, u16 param) \
 { \
@@ -289,3 +461,42 @@ __read_pkg_config(readb, u8);
 __read_pkg_config(readw, u16);
 __read_pkg_config(readl, u32);
 __read_pkg_config(readq, u64);
+
+#define __read_pci_config_local(x, type) \
+struct peci_request * \
+peci_pci_cfg_local_##x(struct peci_device *device, u8 bus, u8 dev, u8 func, u16 reg) \
+{ \
+	return __pci_cfg_local_read(device, bus, dev, func, reg, sizeof(type)); \
+} \
+EXPORT_SYMBOL_NS_GPL(peci_pci_cfg_local_##x, PECI)
+
+__read_pci_config_local(readb, u8);
+__read_pci_config_local(readw, u16);
+__read_pci_config_local(readl, u32);
+
+#define __read_ep_pci_config(x, msg_type, type) \
+struct peci_request * \
+peci_ep_pci_cfg_##x(struct peci_device *device, u8 seg, u8 bus, u8 dev, u8 func, u16 reg) \
+{ \
+	return __ep_pci_cfg_read(device, msg_type, seg, bus, dev, func, reg, sizeof(type)); \
+} \
+EXPORT_SYMBOL_NS_GPL(peci_ep_pci_cfg_##x, PECI)
+
+__read_ep_pci_config(local_readb, PECI_ENDPTCFG_TYPE_LOCAL_PCI, u8);
+__read_ep_pci_config(local_readw, PECI_ENDPTCFG_TYPE_LOCAL_PCI, u16);
+__read_ep_pci_config(local_readl, PECI_ENDPTCFG_TYPE_LOCAL_PCI, u32);
+__read_ep_pci_config(readb, PECI_ENDPTCFG_TYPE_PCI, u8);
+__read_ep_pci_config(readw, PECI_ENDPTCFG_TYPE_PCI, u16);
+__read_ep_pci_config(readl, PECI_ENDPTCFG_TYPE_PCI, u32);
+
+#define __read_ep_mmio(x, y, addr_type, type1, type2) \
+struct peci_request *peci_ep_mmio##y##_##x(struct peci_device *device, u8 bar, u8 seg, \
+					   u8 bus, u8 dev, u8 func, u64 offset) \
+{ \
+	return __ep_mmio_read(device, bar, addr_type, seg, bus, dev, func, \
+			      offset, 10 + sizeof(type1), sizeof(type2)); \
+} \
+EXPORT_SYMBOL_NS_GPL(peci_ep_mmio##y##_##x, PECI)
+
+__read_ep_mmio(readl, 32, PECI_ENDPTCFG_ADDR_TYPE_MMIO_D, u32, u32);
+__read_ep_mmio(readl, 64, PECI_ENDPTCFG_ADDR_TYPE_MMIO_Q, u64, u32);
diff --git a/include/linux/peci-cpu.h b/include/linux/peci-cpu.h
new file mode 100644
index 000000000000..d1b307ec2429
--- /dev/null
+++ b/include/linux/peci-cpu.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2021 Intel Corporation */
+
+#ifndef __LINUX_PECI_CPU_H
+#define __LINUX_PECI_CPU_H
+
+#include <linux/types.h>
+
+#define PECI_PCS_PKG_ID			0  /* Package Identifier Read */
+#define  PECI_PKG_ID_CPU_ID		0x0000  /* CPUID Info */
+#define  PECI_PKG_ID_PLATFORM_ID	0x0001  /* Platform ID */
+#define  PECI_PKG_ID_DEVICE_ID		0x0002  /* Uncore Device ID */
+#define  PECI_PKG_ID_MAX_THREAD_ID	0x0003  /* Max Thread ID */
+#define  PECI_PKG_ID_MICROCODE_REV	0x0004  /* CPU Microcode Update Revision */
+#define  PECI_PKG_ID_MCA_ERROR_LOG	0x0005  /* Machine Check Status */
+#define PECI_PCS_MODULE_TEMP		9  /* Per Core DTS Temperature Read */
+#define PECI_PCS_THERMAL_MARGIN		10 /* DTS thermal margin */
+#define PECI_PCS_DDR_DIMM_TEMP		14 /* DDR DIMM Temperature */
+#define PECI_PCS_TEMP_TARGET		16 /* Temperature Target Read */
+#define PECI_PCS_TDP_UNITS		30 /* Units for power/energy registers */
+
+struct peci_device;
+
+int peci_temp_read(struct peci_device *device, s16 *temp_raw);
+
+int peci_pcs_read(struct peci_device *device, u8 index,
+		  u16 param, u32 *data);
+
+int peci_pci_local_read(struct peci_device *device, u8 bus, u8 dev,
+			u8 func, u16 reg, u32 *data);
+
+int peci_ep_pci_local_read(struct peci_device *device, u8 seg,
+			   u8 bus, u8 dev, u8 func, u16 reg, u32 *data);
+
+int peci_mmio_read(struct peci_device *device, u8 bar, u8 seg,
+		   u8 bus, u8 dev, u8 func, u64 address, u32 *data);
+
+#endif /* __LINUX_PECI_CPU_H */
diff --git a/include/linux/peci.h b/include/linux/peci.h
index f9f37b874011..31f9e628fd11 100644
--- a/include/linux/peci.h
+++ b/include/linux/peci.h
@@ -9,14 +9,6 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
-#define PECI_PCS_PKG_ID			0  /* Package Identifier Read */
-#define  PECI_PKG_ID_CPU_ID		0x0000  /* CPUID Info */
-#define  PECI_PKG_ID_PLATFORM_ID	0x0001  /* Platform ID */
-#define  PECI_PKG_ID_DEVICE_ID		0x0002  /* Uncore Device ID */
-#define  PECI_PKG_ID_MAX_THREAD_ID	0x0003  /* Max Thread ID */
-#define  PECI_PKG_ID_MICROCODE_REV	0x0004  /* CPU Microcode Update Revision */
-#define  PECI_PKG_ID_MCA_ERROR_LOG	0x0005  /* Machine Check Status */
-
 struct peci_request;
 
 /**
-- 
2.31.1

