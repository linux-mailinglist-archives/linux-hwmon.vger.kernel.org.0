Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F65A168DCB
	for <lists+linux-hwmon@lfdr.de>; Sat, 22 Feb 2020 10:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgBVJAQ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 22 Feb 2020 04:00:16 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:60488 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbgBVJAQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Feb 2020 04:00:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=XjM7r6Mpt3qMmQbDrtYG9yDmbk2zB2P9T5vrEtruoKE=; b=hCeOzvF/fHAVTx3NQ+kQeCDVHx
        MSGR2LO61YNK4fYJHlmeBE3j/bcGeZpciu5hPfIPwJYeNeUIWzVsYo0Md2rFxRUsYvRtU6H9yL6KN
        eowSIeip3TbT9G0QISXqC1XkxMDjJ/Du0CNk+/BErAm+IQrmI2Ktk3ssvy4tzJS9RTbghQyeEMjsC
        5nFOcnylJf+9NHBOTk4JiDR6BWFW8fPUZZoTroMvcXFtcsGwaAV6CO1pb0RQqoIelCk60jWJa+ifi
        QMiDTYQzxZQ9buTS3el2tptZ53ufVxzl2/va+rHwsNUKIJZUmGB8FIWlXqyI27TR9+v0mlCZmcHtg
        3WcVX/Rg==;
Received: from [80.156.29.194] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j5Qdz-0007Hp-8x; Sat, 22 Feb 2020 09:00:15 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j5Qdx-001N4P-K1; Sat, 22 Feb 2020 10:00:13 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH 4/7] docs: adm1177: fix a broken reference
Date:   Sat, 22 Feb 2020 10:00:04 +0100
Message-Id: <8d37f465888656224855a21f5bb01edb1ca66cf3.1582361738.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1582361737.git.mchehab+huawei@kernel.org>
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This reference was missing the .rst extension. This would be OK
if it were using the :doc: directive. So, switch to it.

As a side effect, this will create cross-reference links at
html output.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/hwmon/adm1177.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/hwmon/adm1177.rst b/Documentation/hwmon/adm1177.rst
index c81e0b4abd28..471be1e98d6f 100644
--- a/Documentation/hwmon/adm1177.rst
+++ b/Documentation/hwmon/adm1177.rst
@@ -20,8 +20,7 @@ Usage Notes
 -----------
 
 This driver does not auto-detect devices. You will have to instantiate the
-devices explicitly. Please see Documentation/i2c/instantiating-devices for
-details.
+devices explicitly. Please see :doc:`/i2c/instantiating-devices` for details.
 
 
 Sysfs entries
-- 
2.24.1

