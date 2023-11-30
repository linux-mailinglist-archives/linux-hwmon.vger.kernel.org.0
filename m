Return-Path: <linux-hwmon+bounces-264-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5BA7FFBE8
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Nov 2023 21:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38E6CB20E16
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Nov 2023 20:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E19053E06;
	Thu, 30 Nov 2023 20:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m7KA62C4"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB11C198
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Nov 2023 12:02:09 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cfa5840db3so12835655ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Nov 2023 12:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701374529; x=1701979329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SCkKPm1/u5EsG++ESMCMRyJZ1yoLYJTipQPmIG3a/SY=;
        b=m7KA62C4e1xXN+A2gn5vTEGlZwQWRpsGmq+xzmAFkz/MhNotriQUjwqIU1sM9dt5/B
         cfdOKHNStrqt1r+6Gv2Wnucp1Jc/3REbmJTYEHkLeP7Kp6f9yOgP/zE5XQXi/kLJi7+h
         Sv1dK+kV2JJoLtNBFQQhiEaEyYq2Ql0jCzRQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701374529; x=1701979329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCkKPm1/u5EsG++ESMCMRyJZ1yoLYJTipQPmIG3a/SY=;
        b=PgPiSG6x6vISSVLs2Zx5saHSQW19BFejkkjXYa9/gLYMBY+JaBmtOptfLRSJfloATT
         RoR5Vqp+SiwksS8EmRLnQOwI1HD95x40YpYWc8x3SkUlA4BXuDx0idXwZac4kpM928Pz
         SsqZPPxPadbUe/zXjjvKbd75bOVr4lYRH9O6ljyIUqB0aPl/CDnthNes7oPUKs+FH2lt
         BjmS5tQ4XMjkxpHLREUwu/qKIwiEafKKc+N7f76KFif0rwK6dm6YjPW3bTDa8FNfsbyF
         XwvOg+8eU+uqcilnnOTb4s761Ur/xnb9O/nuVKLJnmPOMfT8RKjjaqRhm5HKESUBmmcr
         r7RA==
X-Gm-Message-State: AOJu0YxXeFOGMxVyoJJfqiY6GgR2Wz2Ss0azLKs+MDDiMFcVw5Derj9c
	+bfqfQn9d06nOpoz0TBPhoimPQ==
X-Google-Smtp-Source: AGHT+IGszXhKVVjETjQJezAKG0V+cIgTBp1nXS7syeMPyHIxoe/EaYK0tUmkmrsbHsqqUiWb0XA6Bg==
X-Received: by 2002:a17:902:ab94:b0:1cf:b6a7:67a3 with SMTP id f20-20020a170902ab9400b001cfb6a767a3mr18841460plr.56.1701374529283;
        Thu, 30 Nov 2023 12:02:09 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902744c00b001cfca7b8ec4sm1789326plt.101.2023.11.30.12.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:02:08 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] hwmon: (pc87360) Bounds check data->innr usage
Date: Thu, 30 Nov 2023 12:02:07 -0800
Message-Id: <20231130200207.work.679-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1892; i=keescook@chromium.org;
 h=from:subject:message-id; bh=2B9+0DQZw8GSK0K6KON3uBQG8TgW64VHj87FAuDhq9g=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlaOo/anwlkPtl+uLLxq5xr0ZdwKLNISHKDG96w
 JsEAMB67dWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZWjqPwAKCRCJcvTf3G3A
 Jo6+EACMBXK6p8YSOtaHkRDySUePU+sU54WkTgPH2eeXNI6H0Aui7fZzVUIWtEkmW99rsheV0uE
 5KIjxPIx7cl9NCJPRDFnqNzGYaN/mYQcp4MRxZWaKptsctgR92uI/LRs/D1Kxz9TF31EWP2vFi1
 JtD+ot1vOm3OMRXNzvVrLKZeR3m5JHyxUp2OdFD8U8zPhOSDYfhPCNV2sfRihbOddG4lz2N3X87
 PF8ezB8Ny8LzShDAAx6UhMFhkrFVkF9VgauWfX5yawVy+9n1sshNKc03lMx+C9w7RFi+/iaOmcX
 HsZWRaQFgcOJ+eaA6CITLRznzGb9HEFNkxrrvUWpefLPZpJvf32RL7Fht8vrv+ejEWTdrQCThCM
 lZ4hlOwotCUW5fV0sBwx5DgyeVBvPv3ALfiRgVWsURI17i8baDgCvO6v3rfVy1Fc9CR92XiV8g8
 opxDLkBFY2/r6dNGXLvxTSDQgwo9TXZiTHAZGJmrG0l86r8BKe9lf4YrTT/1WHFCoDK7W3GWL05
 UohpynVgfX5JFZofROWoJ3jd68KhNjZ4yOrmHrObI4o8LOFBDm9p8AvyQAYvyjmZ/UdS5g/7Zb3
 96fFDYw73pqMI0/Um4dCST2Q6Jpdxqhw1J/58dJ9VOT3rRzNj1kXRSZ3VisuH6JdoZZ0v8wgqHK
 R4hlteN XXHoHMww==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Without visibility into the initializers for data->innr, GCC suspects
using it as an index could walk off the end of the various 14-element
arrays in data. Perform an explicit clamp to the array size. Silences
the following warning with GCC 12+:

../drivers/hwmon/pc87360.c: In function 'pc87360_update_device':
../drivers/hwmon/pc87360.c:341:49: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
  341 |                                 data->in_max[i] = pc87360_read_value(data,
      |                                 ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
  342 |                                                   LD_IN, i,
      |                                                   ~~~~~~~~~
  343 |                                                   PC87365_REG_IN_MAX);
      |                                                   ~~~~~~~~~~~~~~~~~~~
../drivers/hwmon/pc87360.c:209:12: note: at offset 255 into destination object 'in_max' of size 14
  209 |         u8 in_max[14];          /* Register value */
      |            ^~~~~~

Cc: Jim Cromie <jim.cromie@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/hwmon/pc87360.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pc87360.c b/drivers/hwmon/pc87360.c
index 926ea1fe133c..db80394ba854 100644
--- a/drivers/hwmon/pc87360.c
+++ b/drivers/hwmon/pc87360.c
@@ -323,7 +323,7 @@ static struct pc87360_data *pc87360_update_device(struct device *dev)
 		}
 
 		/* Voltages */
-		for (i = 0; i < data->innr; i++) {
+		for (i = 0; i < min(data->innr, ARRAY_SIZE(data->in)); i++) {
 			data->in_status[i] = pc87360_read_value(data, LD_IN, i,
 					     PC87365_REG_IN_STATUS);
 			/* Clear bits */
-- 
2.34.1


