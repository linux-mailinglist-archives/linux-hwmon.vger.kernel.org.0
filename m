Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 852C6419112
	for <lists+linux-hwmon@lfdr.de>; Mon, 27 Sep 2021 10:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233532AbhI0Ir7 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 27 Sep 2021 04:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233507AbhI0Ir6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Sep 2021 04:47:58 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD45C061604
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Sep 2021 01:46:20 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y26so34609708lfa.11
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Sep 2021 01:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U0zut/STrbzFzEaYGrjx8N7OZIB3TgBNbxo/HurOdUQ=;
        b=VBqpJXNDaL4icGpXRQtO2EpchiZGOb5gwRgp6IuJymn7c5Lx3j0LZ4s9DVi8oAe6bw
         QDQzplH1FcaAZ3hvbKOfOxr3EXJ8fKgEKlLcwWo5cQWbezaXBMdMcxOnKhK/HxATUNrp
         t+N6o00WIUC6InRAFXAh1Ixc5tFW7SjZMzLkL3ThmqWzz+5bpSVWAM50FHKDcxD4RGzn
         rw60tIZ9LCzTIpbeGxMkwHuK+U/hFNIGv1aTZ7QxJh7IK2XmnHWoswxmt+vKjS+KHCuk
         7YCoZvkPJiwUaE+PgqBtEklKHuulNlsnyBwVMotvn4DQr7V8ScloLMWzvXFztV8/OqGP
         zGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U0zut/STrbzFzEaYGrjx8N7OZIB3TgBNbxo/HurOdUQ=;
        b=6vwMLUbfIMuPwbd+1GFaDMJkBHtqGXBYCtW1/lv/BIR5moSSYn380rU1Tz5GkwBwy4
         Gy7KqtzMMFlMAYznykGs/gYaJ5qDVwLzrxiZg51vIr735HFeURWFHTGrFaeF3Q1Km8+C
         LuOgxWrJDUNwqR8ZE3dZlv2ECca09457cNn4ans6E5Uy5feYqipCjKv7uWdlpR6RWY8A
         YqADqssjPEKrXDxUCoqss/Xuz1FnLiB0S2jjkuZBsOeoBhJEdjAVbRnFbWfml4Spgntc
         5cCO6gGP0mcqIAmrur0ZD4jilkPyO9giU9GT424tffcpgktciwMi3Yyny1u0Ci69P3Tb
         05Qg==
X-Gm-Message-State: AOAM531pzofqmDb2Np2ZgOBptLyn/+XRhifY4p60vRd9z02Dfc5QsdSr
        RsuSrL2RAJWfrQwF1+cs04pEcA==
X-Google-Smtp-Source: ABdhPJyy4wq8y7JCvg1Nd9f2qhYuJ03dtZEMmiEuqunDVQyRQ2qJLc3EBEZlNTGNt7M0wqKYpIl0Zg==
X-Received: by 2002:a2e:145c:: with SMTP id 28mr19708234lju.295.1632732378811;
        Mon, 27 Sep 2021 01:46:18 -0700 (PDT)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id c3sm128196ljf.113.2021.09.27.01.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 01:46:18 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     jejb@linux.ibm.com, martin.petersen@oracle.com, jdelvare@suse.com,
        linux@roeck-us.net
Cc:     avri.altman@wdc.com, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCHv2] scsi: ufs: Kconfig: SCSI_UFS_HWMON depens on HWMON=y
Date:   Mon, 27 Sep 2021 10:46:15 +0200
Message-Id: <20210927084615.1938432-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <DM6PR04MB6575F2F6841B0573560E10ADFCA49@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <DM6PR04MB6575F2F6841B0573560E10ADFCA49@DM6PR04MB6575.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

When building an allmodconfig kernel, the following build error shows
up:

aarch64-linux-gnu-ld: drivers/scsi/ufs/ufs-hwmon.o: in function `ufs_hwmon_probe':
/kernel/next/drivers/scsi/ufs/ufs-hwmon.c:177: undefined reference to `hwmon_device_register_with_info'
/kernel/next/drivers/scsi/ufs/ufs-hwmon.c:177:(.text+0x510): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `hwmon_device_register_with_info'
aarch64-linux-gnu-ld: drivers/scsi/ufs/ufs-hwmon.o: in function `ufs_hwmon_remove':
/kernel/next/drivers/scsi/ufs/ufs-hwmon.c:195: undefined reference to `hwmon_device_unregister'
/kernel/next/drivers/scsi/ufs/ufs-hwmon.c:195:(.text+0x5c8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `hwmon_device_unregister'
aarch64-linux-gnu-ld: drivers/scsi/ufs/ufs-hwmon.o: in function `ufs_hwmon_notify_event':
/kernel/next/drivers/scsi/ufs/ufs-hwmon.c:206: undefined reference to `hwmon_notify_event'
/kernel/next/drivers/scsi/ufs/ufs-hwmon.c:206:(.text+0x64c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `hwmon_notify_event'
aarch64-linux-gnu-ld: /home/anders/src/kernel/next/drivers/scsi/ufs/ufs-hwmon.c:209: undefined reference to `hwmon_notify_event'
/kernel/next/drivers/scsi/ufs/ufs-hwmon.c:209:(.text+0x66c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `hwmon_notify_event'

Since fragment 'SCSI_UFS_HWMON' can't be build as a module,
'SCSI_UFS_HWMON' has to depend on 'HWMON=y'.

Fixes: e88e2d32200a ("scsi: ufs: core: Probe for temperature notification support")
Also-Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
Acked-by: Avri Altman <avri.altman@wdc.com>
---
 drivers/scsi/ufs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/Kconfig b/drivers/scsi/ufs/Kconfig
index 565e8aa6319d..2ca69f87e4de 100644
--- a/drivers/scsi/ufs/Kconfig
+++ b/drivers/scsi/ufs/Kconfig
@@ -202,7 +202,7 @@ config SCSI_UFS_FAULT_INJECTION
 
 config SCSI_UFS_HWMON
 	bool "UFS  Temperature Notification"
-	depends on SCSI_UFSHCD && HWMON
+	depends on SCSI_UFSHCD=HWMON || HWMON=y
 	help
 	  This provides support for UFS hardware monitoring. If enabled,
 	  a hardware monitoring device will be created for the UFS device.
-- 
2.33.0

