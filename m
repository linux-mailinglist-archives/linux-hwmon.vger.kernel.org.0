Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30223CA6DC
	for <lists+linux-hwmon@lfdr.de>; Thu,  3 Oct 2019 18:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393046AbfJCQsK (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 3 Oct 2019 12:48:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:33764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393043AbfJCQsJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 3 Oct 2019 12:48:09 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5ADD820865;
        Thu,  3 Oct 2019 16:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570121288;
        bh=CNYbvKqNLOZehyxPnHnVXigu4DTXN2+614tsG+MGyi4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rhIEZTtA8LZ6JetY54Nu4eVoC+sy94dg3HTk2q8IN9rh3+5DOk9G5DysZoq769Ql2
         RpgMu8VRGtTTg9J7vQY/N4GrMyonYQL4u4grAzcZHwf4Fkr2dm7KIAKAy1M84S299j
         WvGzSot9lbNa+SmHAYyFvMnOjerg5GfLSZe2MIho=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Vicki Pfau <vi@endrift.com>,
        Marcel Bocu <marcel.p.bocu@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Brian Woods <brian.woods@amd.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Woods, Brian" <Brian.Woods@amd.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 5.3 188/344] x86/amd_nb: Add PCI device IDs for family 17h, model 70h
Date:   Thu,  3 Oct 2019 17:52:33 +0200
Message-Id: <20191003154558.743450158@linuxfoundation.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191003154540.062170222@linuxfoundation.org>
References: <20191003154540.062170222@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Marcel Bocu <marcel.p.bocu@gmail.com>

[ Upstream commit af4e1c5eca95bed1192d8dc45c8ed63aea2209e8 ]

The AMD Ryzen gen 3 processors came with a different PCI IDs for the
function 3 & 4 which are used to access the SMN interface. The root
PCI address however remained at the same address as the model 30h.

Adding the F3/F4 PCI IDs respectively to the misc and link ids appear
to be sufficient for k10temp, so let's add them and follow up on the
patch if other functions need more tweaking.

Vicki Pfau sent an identical patch after I checked that no-one had
written this patch. I would have been happy about dropping my patch but
unlike for his patch series, I had already Cc:ed the x86 people and
they already reviewed the changes. Since Vicki has not answered to
any email after his initial series, let's assume she is on vacation
and let's avoid duplication of reviews from the maintainers and merge
my series. To acknowledge Vicki's anteriority, I added her S-o-b to
the patch.

v2, suggested by Guenter Roeck and Brian Woods:
 - rename from 71h to 70h

Signed-off-by: Vicki Pfau <vi@endrift.com>
Signed-off-by: Marcel Bocu <marcel.p.bocu@gmail.com>
Tested-by: Marcel Bocu <marcel.p.bocu@gmail.com>
Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Brian Woods <brian.woods@amd.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>	# pci_ids.h

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
Cc: "Woods, Brian" <Brian.Woods@amd.com>
Cc: Clemens Ladisch <clemens@ladisch.de>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Link: https://lore.kernel.org/r/20190722174510.2179-1-marcel.p.bocu@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/kernel/amd_nb.c | 3 +++
 include/linux/pci_ids.h  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index d63e63b7d1d95..251c795b4eb3c 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -21,6 +21,7 @@
 #define PCI_DEVICE_ID_AMD_17H_DF_F4	0x1464
 #define PCI_DEVICE_ID_AMD_17H_M10H_DF_F4 0x15ec
 #define PCI_DEVICE_ID_AMD_17H_M30H_DF_F4 0x1494
+#define PCI_DEVICE_ID_AMD_17H_M70H_DF_F4 0x1444
 
 /* Protect the PCI config register pairs used for SMN and DF indirect access. */
 static DEFINE_MUTEX(smn_mutex);
@@ -50,6 +51,7 @@ const struct pci_device_id amd_nb_misc_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M30H_DF_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F3) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F3) },
 	{}
 };
 EXPORT_SYMBOL_GPL(amd_nb_misc_ids);
@@ -63,6 +65,7 @@ static const struct pci_device_id amd_nb_link_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M30H_DF_F4) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F4) },
 	{}
 };
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index c842735a4f45a..4b97f427cc929 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -548,6 +548,7 @@
 #define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
 #define PCI_DEVICE_ID_AMD_17H_M10H_DF_F3 0x15eb
 #define PCI_DEVICE_ID_AMD_17H_M30H_DF_F3 0x1493
+#define PCI_DEVICE_ID_AMD_17H_M70H_DF_F3 0x1443
 #define PCI_DEVICE_ID_AMD_CNB17H_F3	0x1703
 #define PCI_DEVICE_ID_AMD_LANCE		0x2000
 #define PCI_DEVICE_ID_AMD_LANCE_HOME	0x2001
-- 
2.20.1



