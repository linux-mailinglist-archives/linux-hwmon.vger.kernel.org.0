Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40D2275A36
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jul 2019 00:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfGYWDg (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 25 Jul 2019 18:03:36 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:47572 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbfGYWDf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Jul 2019 18:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1564092213; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LoJwb2YRwVVG1E+P5Na8ZaIv1qhfmSpN/lRmTil5iU8=;
        b=lDgIJ/SZVMs0cGICdu3BVH9dCmTiy8zBSbPA/XqifCbIBRNvzpcG7fzZ5EbzQi5mVAxmvI
        fLfp8K3ay3Ju1PGClbq18Gxdq3dVbJcebSH4q9bdwkGX1uQqvhv/mVXtyiHs2a8zI1MwMd
        y6lEXPAmtlnsEwGHXa/EibhKiZQYg6A=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Sebastian Reichel <sre@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     od@zcrc.me, devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
        Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH 07/11] mtd: rawnand: Drop obsolete JZ4740 NAND driver
Date:   Thu, 25 Jul 2019 18:02:11 -0400
Message-Id: <20190725220215.460-8-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-1-paul@crapouillou.net>
References: <20190725220215.460-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

It has been replaced with the newer Ingenic NAND driver.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---
 drivers/mtd/nand/raw/ingenic/Kconfig       |   7 -
 drivers/mtd/nand/raw/ingenic/Makefile      |   1 -
 drivers/mtd/nand/raw/ingenic/jz4740_nand.c | 536 ---------------------
 3 files changed, 544 deletions(-)
 delete mode 100644 drivers/mtd/nand/raw/ingenic/jz4740_nand.c

diff --git a/drivers/mtd/nand/raw/ingenic/Kconfig b/drivers/mtd/nand/raw/ingenic/Kconfig
index 66b7cffdb0c2..e30feb56b650 100644
--- a/drivers/mtd/nand/raw/ingenic/Kconfig
+++ b/drivers/mtd/nand/raw/ingenic/Kconfig
@@ -1,11 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config MTD_NAND_JZ4740
-	tristate "JZ4740 NAND controller"
-	depends on MACH_JZ4740 || COMPILE_TEST
-	depends on HAS_IOMEM
-	help
-	  Enables support for NAND Flash on JZ4740 SoC based boards.
-
 config MTD_NAND_JZ4780
 	tristate "JZ4780 NAND controller"
 	depends on JZ4780_NEMC
diff --git a/drivers/mtd/nand/raw/ingenic/Makefile b/drivers/mtd/nand/raw/ingenic/Makefile
index b63d36889263..4c53f5e759c3 100644
--- a/drivers/mtd/nand/raw/ingenic/Makefile
+++ b/drivers/mtd/nand/raw/ingenic/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_MTD_NAND_JZ4740) += jz4740_nand.o
 obj-$(CONFIG_MTD_NAND_JZ4780) += ingenic_nand.o
 
 ingenic_nand-y += ingenic_nand_drv.o
diff --git a/drivers/mtd/nand/raw/ingenic/jz4740_nand.c b/drivers/mtd/nand/raw/ingenic/jz4740_nand.c
deleted file mode 100644
index acdf674fcc87..000000000000
--- a/drivers/mtd/nand/raw/ingenic/jz4740_nand.c
+++ /dev/null
@@ -1,536 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
- *  JZ4740 SoC NAND controller driver
- */
-
-#include <linux/io.h>
-#include <linux/ioport.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/rawnand.h>
-#include <linux/mtd/partitions.h>
-
-#include <linux/gpio/consumer.h>
-
-#include <linux/platform_data/jz4740/jz4740_nand.h>
-
-#define JZ_REG_NAND_CTRL	0x50
-#define JZ_REG_NAND_ECC_CTRL	0x100
-#define JZ_REG_NAND_DATA	0x104
-#define JZ_REG_NAND_PAR0	0x108
-#define JZ_REG_NAND_PAR1	0x10C
-#define JZ_REG_NAND_PAR2	0x110
-#define JZ_REG_NAND_IRQ_STAT	0x114
-#define JZ_REG_NAND_IRQ_CTRL	0x118
-#define JZ_REG_NAND_ERR(x)	(0x11C + ((x) << 2))
-
-#define JZ_NAND_ECC_CTRL_PAR_READY	BIT(4)
-#define JZ_NAND_ECC_CTRL_ENCODING	BIT(3)
-#define JZ_NAND_ECC_CTRL_RS		BIT(2)
-#define JZ_NAND_ECC_CTRL_RESET		BIT(1)
-#define JZ_NAND_ECC_CTRL_ENABLE		BIT(0)
-
-#define JZ_NAND_STATUS_ERR_COUNT	(BIT(31) | BIT(30) | BIT(29))
-#define JZ_NAND_STATUS_PAD_FINISH	BIT(4)
-#define JZ_NAND_STATUS_DEC_FINISH	BIT(3)
-#define JZ_NAND_STATUS_ENC_FINISH	BIT(2)
-#define JZ_NAND_STATUS_UNCOR_ERROR	BIT(1)
-#define JZ_NAND_STATUS_ERROR		BIT(0)
-
-#define JZ_NAND_CTRL_ENABLE_CHIP(x) BIT((x) << 1)
-#define JZ_NAND_CTRL_ASSERT_CHIP(x) BIT(((x) << 1) + 1)
-#define JZ_NAND_CTRL_ASSERT_CHIP_MASK 0xaa
-
-#define JZ_NAND_MEM_CMD_OFFSET 0x08000
-#define JZ_NAND_MEM_ADDR_OFFSET 0x10000
-
-struct jz_nand {
-	struct nand_chip chip;
-	void __iomem *base;
-	struct resource *mem;
-
-	unsigned char banks[JZ_NAND_NUM_BANKS];
-	void __iomem *bank_base[JZ_NAND_NUM_BANKS];
-	struct resource *bank_mem[JZ_NAND_NUM_BANKS];
-
-	int selected_bank;
-
-	struct gpio_desc *busy_gpio;
-	bool is_reading;
-};
-
-static inline struct jz_nand *mtd_to_jz_nand(struct mtd_info *mtd)
-{
-	return container_of(mtd_to_nand(mtd), struct jz_nand, chip);
-}
-
-static void jz_nand_select_chip(struct nand_chip *chip, int chipnr)
-{
-	struct jz_nand *nand = mtd_to_jz_nand(nand_to_mtd(chip));
-	uint32_t ctrl;
-	int banknr;
-
-	ctrl = readl(nand->base + JZ_REG_NAND_CTRL);
-	ctrl &= ~JZ_NAND_CTRL_ASSERT_CHIP_MASK;
-
-	if (chipnr == -1) {
-		banknr = -1;
-	} else {
-		banknr = nand->banks[chipnr] - 1;
-		chip->legacy.IO_ADDR_R = nand->bank_base[banknr];
-		chip->legacy.IO_ADDR_W = nand->bank_base[banknr];
-	}
-	writel(ctrl, nand->base + JZ_REG_NAND_CTRL);
-
-	nand->selected_bank = banknr;
-}
-
-static void jz_nand_cmd_ctrl(struct nand_chip *chip, int dat,
-			     unsigned int ctrl)
-{
-	struct jz_nand *nand = mtd_to_jz_nand(nand_to_mtd(chip));
-	uint32_t reg;
-	void __iomem *bank_base = nand->bank_base[nand->selected_bank];
-
-	BUG_ON(nand->selected_bank < 0);
-
-	if (ctrl & NAND_CTRL_CHANGE) {
-		BUG_ON((ctrl & NAND_ALE) && (ctrl & NAND_CLE));
-		if (ctrl & NAND_ALE)
-			bank_base += JZ_NAND_MEM_ADDR_OFFSET;
-		else if (ctrl & NAND_CLE)
-			bank_base += JZ_NAND_MEM_CMD_OFFSET;
-		chip->legacy.IO_ADDR_W = bank_base;
-
-		reg = readl(nand->base + JZ_REG_NAND_CTRL);
-		if (ctrl & NAND_NCE)
-			reg |= JZ_NAND_CTRL_ASSERT_CHIP(nand->selected_bank);
-		else
-			reg &= ~JZ_NAND_CTRL_ASSERT_CHIP(nand->selected_bank);
-		writel(reg, nand->base + JZ_REG_NAND_CTRL);
-	}
-	if (dat != NAND_CMD_NONE)
-		writeb(dat, chip->legacy.IO_ADDR_W);
-}
-
-static int jz_nand_dev_ready(struct nand_chip *chip)
-{
-	struct jz_nand *nand = mtd_to_jz_nand(nand_to_mtd(chip));
-	return gpiod_get_value_cansleep(nand->busy_gpio);
-}
-
-static void jz_nand_hwctl(struct nand_chip *chip, int mode)
-{
-	struct jz_nand *nand = mtd_to_jz_nand(nand_to_mtd(chip));
-	uint32_t reg;
-
-	writel(0, nand->base + JZ_REG_NAND_IRQ_STAT);
-	reg = readl(nand->base + JZ_REG_NAND_ECC_CTRL);
-
-	reg |= JZ_NAND_ECC_CTRL_RESET;
-	reg |= JZ_NAND_ECC_CTRL_ENABLE;
-	reg |= JZ_NAND_ECC_CTRL_RS;
-
-	switch (mode) {
-	case NAND_ECC_READ:
-		reg &= ~JZ_NAND_ECC_CTRL_ENCODING;
-		nand->is_reading = true;
-		break;
-	case NAND_ECC_WRITE:
-		reg |= JZ_NAND_ECC_CTRL_ENCODING;
-		nand->is_reading = false;
-		break;
-	default:
-		break;
-	}
-
-	writel(reg, nand->base + JZ_REG_NAND_ECC_CTRL);
-}
-
-static int jz_nand_calculate_ecc_rs(struct nand_chip *chip, const uint8_t *dat,
-				    uint8_t *ecc_code)
-{
-	struct jz_nand *nand = mtd_to_jz_nand(nand_to_mtd(chip));
-	uint32_t reg, status;
-	int i;
-	unsigned int timeout = 1000;
-	static uint8_t empty_block_ecc[] = {0xcd, 0x9d, 0x90, 0x58, 0xf4,
-						0x8b, 0xff, 0xb7, 0x6f};
-
-	if (nand->is_reading)
-		return 0;
-
-	do {
-		status = readl(nand->base + JZ_REG_NAND_IRQ_STAT);
-	} while (!(status & JZ_NAND_STATUS_ENC_FINISH) && --timeout);
-
-	if (timeout == 0)
-	    return -1;
-
-	reg = readl(nand->base + JZ_REG_NAND_ECC_CTRL);
-	reg &= ~JZ_NAND_ECC_CTRL_ENABLE;
-	writel(reg, nand->base + JZ_REG_NAND_ECC_CTRL);
-
-	for (i = 0; i < 9; ++i)
-		ecc_code[i] = readb(nand->base + JZ_REG_NAND_PAR0 + i);
-
-	/* If the written data is completly 0xff, we also want to write 0xff as
-	 * ecc, otherwise we will get in trouble when doing subpage writes. */
-	if (memcmp(ecc_code, empty_block_ecc, 9) == 0)
-		memset(ecc_code, 0xff, 9);
-
-	return 0;
-}
-
-static void jz_nand_correct_data(uint8_t *dat, int index, int mask)
-{
-	int offset = index & 0x7;
-	uint16_t data;
-
-	index += (index >> 3);
-
-	data = dat[index];
-	data |= dat[index+1] << 8;
-
-	mask ^= (data >> offset) & 0x1ff;
-	data &= ~(0x1ff << offset);
-	data |= (mask << offset);
-
-	dat[index] = data & 0xff;
-	dat[index+1] = (data >> 8) & 0xff;
-}
-
-static int jz_nand_correct_ecc_rs(struct nand_chip *chip, uint8_t *dat,
-				  uint8_t *read_ecc, uint8_t *calc_ecc)
-{
-	struct jz_nand *nand = mtd_to_jz_nand(nand_to_mtd(chip));
-	int i, error_count, index;
-	uint32_t reg, status, error;
-	unsigned int timeout = 1000;
-
-	for (i = 0; i < 9; ++i)
-		writeb(read_ecc[i], nand->base + JZ_REG_NAND_PAR0 + i);
-
-	reg = readl(nand->base + JZ_REG_NAND_ECC_CTRL);
-	reg |= JZ_NAND_ECC_CTRL_PAR_READY;
-	writel(reg, nand->base + JZ_REG_NAND_ECC_CTRL);
-
-	do {
-		status = readl(nand->base + JZ_REG_NAND_IRQ_STAT);
-	} while (!(status & JZ_NAND_STATUS_DEC_FINISH) && --timeout);
-
-	if (timeout == 0)
-		return -ETIMEDOUT;
-
-	reg = readl(nand->base + JZ_REG_NAND_ECC_CTRL);
-	reg &= ~JZ_NAND_ECC_CTRL_ENABLE;
-	writel(reg, nand->base + JZ_REG_NAND_ECC_CTRL);
-
-	if (status & JZ_NAND_STATUS_ERROR) {
-		if (status & JZ_NAND_STATUS_UNCOR_ERROR)
-			return -EBADMSG;
-
-		error_count = (status & JZ_NAND_STATUS_ERR_COUNT) >> 29;
-
-		for (i = 0; i < error_count; ++i) {
-			error = readl(nand->base + JZ_REG_NAND_ERR(i));
-			index = ((error >> 16) & 0x1ff) - 1;
-			if (index >= 0 && index < 512)
-				jz_nand_correct_data(dat, index, error & 0x1ff);
-		}
-
-		return error_count;
-	}
-
-	return 0;
-}
-
-static int jz_nand_ioremap_resource(struct platform_device *pdev,
-	const char *name, struct resource **res, void __iomem **base)
-{
-	int ret;
-
-	*res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
-	if (!*res) {
-		dev_err(&pdev->dev, "Failed to get platform %s memory\n", name);
-		ret = -ENXIO;
-		goto err;
-	}
-
-	*res = request_mem_region((*res)->start, resource_size(*res),
-				pdev->name);
-	if (!*res) {
-		dev_err(&pdev->dev, "Failed to request %s memory region\n", name);
-		ret = -EBUSY;
-		goto err;
-	}
-
-	*base = ioremap((*res)->start, resource_size(*res));
-	if (!*base) {
-		dev_err(&pdev->dev, "Failed to ioremap %s memory region\n", name);
-		ret = -EBUSY;
-		goto err_release_mem;
-	}
-
-	return 0;
-
-err_release_mem:
-	release_mem_region((*res)->start, resource_size(*res));
-err:
-	*res = NULL;
-	*base = NULL;
-	return ret;
-}
-
-static inline void jz_nand_iounmap_resource(struct resource *res,
-					    void __iomem *base)
-{
-	iounmap(base);
-	release_mem_region(res->start, resource_size(res));
-}
-
-static int jz_nand_detect_bank(struct platform_device *pdev,
-			       struct jz_nand *nand, unsigned char bank,
-			       size_t chipnr, uint8_t *nand_maf_id,
-			       uint8_t *nand_dev_id)
-{
-	int ret;
-	char res_name[6];
-	uint32_t ctrl;
-	struct nand_chip *chip = &nand->chip;
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct nand_memory_organization *memorg;
-	u8 id[2];
-
-	memorg = nanddev_get_memorg(&chip->base);
-
-	/* Request I/O resource. */
-	sprintf(res_name, "bank%d", bank);
-	ret = jz_nand_ioremap_resource(pdev, res_name,
-					&nand->bank_mem[bank - 1],
-					&nand->bank_base[bank - 1]);
-	if (ret)
-		return ret;
-
-	/* Enable chip in bank. */
-	ctrl = readl(nand->base + JZ_REG_NAND_CTRL);
-	ctrl |= JZ_NAND_CTRL_ENABLE_CHIP(bank - 1);
-	writel(ctrl, nand->base + JZ_REG_NAND_CTRL);
-
-	if (chipnr == 0) {
-		/* Detect first chip. */
-		ret = nand_scan(chip, 1);
-		if (ret)
-			goto notfound_id;
-
-		/* Retrieve the IDs from the first chip. */
-		nand_select_target(chip, 0);
-		nand_reset_op(chip);
-		nand_readid_op(chip, 0, id, sizeof(id));
-		*nand_maf_id = id[0];
-		*nand_dev_id = id[1];
-	} else {
-		/* Detect additional chip. */
-		nand_select_target(chip, chipnr);
-		nand_reset_op(chip);
-		nand_readid_op(chip, 0, id, sizeof(id));
-		if (*nand_maf_id != id[0] || *nand_dev_id != id[1]) {
-			ret = -ENODEV;
-			goto notfound_id;
-		}
-
-		/* Update size of the MTD. */
-		memorg->ntargets++;
-		mtd->size += nanddev_target_size(&chip->base);
-	}
-
-	dev_info(&pdev->dev, "Found chip %zu on bank %i\n", chipnr, bank);
-	return 0;
-
-notfound_id:
-	dev_info(&pdev->dev, "No chip found on bank %i\n", bank);
-	ctrl &= ~(JZ_NAND_CTRL_ENABLE_CHIP(bank - 1));
-	writel(ctrl, nand->base + JZ_REG_NAND_CTRL);
-	jz_nand_iounmap_resource(nand->bank_mem[bank - 1],
-				 nand->bank_base[bank - 1]);
-	return ret;
-}
-
-static int jz_nand_attach_chip(struct nand_chip *chip)
-{
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct device *dev = mtd->dev.parent;
-	struct jz_nand_platform_data *pdata = dev_get_platdata(dev);
-	struct platform_device *pdev = to_platform_device(dev);
-
-	if (pdata && pdata->ident_callback)
-		pdata->ident_callback(pdev, mtd, &pdata->partitions,
-				      &pdata->num_partitions);
-
-	return 0;
-}
-
-static const struct nand_controller_ops jz_nand_controller_ops = {
-	.attach_chip = jz_nand_attach_chip,
-};
-
-static int jz_nand_probe(struct platform_device *pdev)
-{
-	int ret;
-	struct jz_nand *nand;
-	struct nand_chip *chip;
-	struct mtd_info *mtd;
-	struct jz_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	size_t chipnr, bank_idx;
-	uint8_t nand_maf_id = 0, nand_dev_id = 0;
-
-	nand = kzalloc(sizeof(*nand), GFP_KERNEL);
-	if (!nand)
-		return -ENOMEM;
-
-	ret = jz_nand_ioremap_resource(pdev, "mmio", &nand->mem, &nand->base);
-	if (ret)
-		goto err_free;
-
-	nand->busy_gpio = devm_gpiod_get_optional(&pdev->dev, "busy", GPIOD_IN);
-	if (IS_ERR(nand->busy_gpio)) {
-		ret = PTR_ERR(nand->busy_gpio);
-		dev_err(&pdev->dev, "Failed to request busy gpio %d\n",
-		    ret);
-		goto err_iounmap_mmio;
-	}
-
-	chip		= &nand->chip;
-	mtd		= nand_to_mtd(chip);
-	mtd->dev.parent = &pdev->dev;
-	mtd->name	= "jz4740-nand";
-
-	chip->ecc.hwctl		= jz_nand_hwctl;
-	chip->ecc.calculate	= jz_nand_calculate_ecc_rs;
-	chip->ecc.correct	= jz_nand_correct_ecc_rs;
-	chip->ecc.mode		= NAND_ECC_HW_OOB_FIRST;
-	chip->ecc.size		= 512;
-	chip->ecc.bytes		= 9;
-	chip->ecc.strength	= 4;
-	chip->ecc.options	= NAND_ECC_GENERIC_ERASED_CHECK;
-
-	chip->legacy.chip_delay = 50;
-	chip->legacy.cmd_ctrl = jz_nand_cmd_ctrl;
-	chip->legacy.select_chip = jz_nand_select_chip;
-	chip->legacy.dummy_controller.ops = &jz_nand_controller_ops;
-
-	if (nand->busy_gpio)
-		chip->legacy.dev_ready = jz_nand_dev_ready;
-
-	platform_set_drvdata(pdev, nand);
-
-	/* We are going to autodetect NAND chips in the banks specified in the
-	 * platform data. Although nand_scan_ident() can detect multiple chips,
-	 * it requires those chips to be numbered consecuitively, which is not
-	 * always the case for external memory banks. And a fixed chip-to-bank
-	 * mapping is not practical either, since for example Dingoo units
-	 * produced at different times have NAND chips in different banks.
-	 */
-	chipnr = 0;
-	for (bank_idx = 0; bank_idx < JZ_NAND_NUM_BANKS; bank_idx++) {
-		unsigned char bank;
-
-		/* If there is no platform data, look for NAND in bank 1,
-		 * which is the most likely bank since it is the only one
-		 * that can be booted from.
-		 */
-		bank = pdata ? pdata->banks[bank_idx] : bank_idx ^ 1;
-		if (bank == 0)
-			break;
-		if (bank > JZ_NAND_NUM_BANKS) {
-			dev_warn(&pdev->dev,
-				"Skipping non-existing bank: %d\n", bank);
-			continue;
-		}
-		/* The detection routine will directly or indirectly call
-		 * jz_nand_select_chip(), so nand->banks has to contain the
-		 * bank we're checking.
-		 */
-		nand->banks[chipnr] = bank;
-		if (jz_nand_detect_bank(pdev, nand, bank, chipnr,
-					&nand_maf_id, &nand_dev_id) == 0)
-			chipnr++;
-		else
-			nand->banks[chipnr] = 0;
-	}
-	if (chipnr == 0) {
-		dev_err(&pdev->dev, "No NAND chips found\n");
-		goto err_iounmap_mmio;
-	}
-
-	ret = mtd_device_register(mtd, pdata ? pdata->partitions : NULL,
-				  pdata ? pdata->num_partitions : 0);
-
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to add mtd device\n");
-		goto err_cleanup_nand;
-	}
-
-	dev_info(&pdev->dev, "Successfully registered JZ4740 NAND driver\n");
-
-	return 0;
-
-err_cleanup_nand:
-	nand_cleanup(chip);
-	while (chipnr--) {
-		unsigned char bank = nand->banks[chipnr];
-		jz_nand_iounmap_resource(nand->bank_mem[bank - 1],
-					 nand->bank_base[bank - 1]);
-	}
-	writel(0, nand->base + JZ_REG_NAND_CTRL);
-err_iounmap_mmio:
-	jz_nand_iounmap_resource(nand->mem, nand->base);
-err_free:
-	kfree(nand);
-	return ret;
-}
-
-static int jz_nand_remove(struct platform_device *pdev)
-{
-	struct jz_nand *nand = platform_get_drvdata(pdev);
-	size_t i;
-
-	nand_release(&nand->chip);
-
-	/* Deassert and disable all chips */
-	writel(0, nand->base + JZ_REG_NAND_CTRL);
-
-	for (i = 0; i < JZ_NAND_NUM_BANKS; ++i) {
-		unsigned char bank = nand->banks[i];
-		if (bank != 0) {
-			jz_nand_iounmap_resource(nand->bank_mem[bank - 1],
-						 nand->bank_base[bank - 1]);
-		}
-	}
-
-	jz_nand_iounmap_resource(nand->mem, nand->base);
-
-	kfree(nand);
-
-	return 0;
-}
-
-static struct platform_driver jz_nand_driver = {
-	.probe = jz_nand_probe,
-	.remove = jz_nand_remove,
-	.driver = {
-		.name = "jz4740-nand",
-	},
-};
-
-module_platform_driver(jz_nand_driver);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
-MODULE_DESCRIPTION("NAND controller driver for JZ4740 SoC");
-MODULE_ALIAS("platform:jz4740-nand");
-- 
2.21.0.593.g511ec345e18

