Return-Path: <linux-hwmon+bounces-101-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DD87EEC48
	for <lists+linux-hwmon@lfdr.de>; Fri, 17 Nov 2023 07:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18E6F1C208EC
	for <lists+linux-hwmon@lfdr.de>; Fri, 17 Nov 2023 06:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C0763D;
	Fri, 17 Nov 2023 06:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2gteYP0"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E5FD49;
	Thu, 16 Nov 2023 22:40:39 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso228703866b.1;
        Thu, 16 Nov 2023 22:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700203238; x=1700808038; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TJeM0UPZbg4EOysqQFDW8uCltRVNjJPSKQ5K1d0kcZ8=;
        b=U2gteYP0Qw86TdhHeFBMOX6Rub9JrG3sZdIKJBrEv99xApqGube8GKmeXfyMysbnbG
         mDmVpQV28bBg0GIcE79jetUASx93BQgG3/hoKqzAkxFgjqv07h+2JSzwKwwzvTwA4ti2
         ZXm5NMtuuI3/RrOYRp71EArMs7kC+SPhHaPrmP+8jm7pPPRZDMom2VTQEtd3Nt2CWDit
         0NCMB3rYYAQOdnSfEYyPxH36EpiGITgy0bALS8Spz79ZenmIP41H4NqwAqGmfRRb5BNN
         UZqeGv/EKiQ/kr8rb4oK5Bs3+Mlz0OglbskNt47Dp2R3FAYMpzogG+9raWVzGfCiCS+m
         sH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700203238; x=1700808038;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJeM0UPZbg4EOysqQFDW8uCltRVNjJPSKQ5K1d0kcZ8=;
        b=u6MbAefkJzQhucAu4HJcnKKfh1tBkF2kWFvrqBk0OCYOaNFDd/DnrJX87TyXWofeLF
         dPB2dodp1ghSz6033NWT2W+sDCT5jZjClEGfsmF5rHd6qsECqi6Sef8nDu02DYswLMJp
         gW7Y3HgMjuR4X4QHNprI2nTiWWO18KCFTm/yBwMZKMMYvx5lNiEjCwrU8HYAl4bKVdLZ
         dgyL7DZzSOU0QmkIvLv3Tbk3b4A1UcMO3rjt+tuToO+Mfg1URGcPjYXAhSAVyy0hlxDQ
         D5hmH5ZUSHgRh5351D5ymnNh9/tFp5bnUd9K5cYX+tw3QmdU3jtbdrzOWnZMoI8BaCpk
         y5mg==
X-Gm-Message-State: AOJu0YxvVLoRfHF7dc6WyP5xWda853+qvFQdpwGQ8R0GUn4VVmV9HMgq
	zj4NPHLGhAK/XsIjBhEAuK0=
X-Google-Smtp-Source: AGHT+IG4nfIiSvLOZhHXUzrmqtlexpnVhfKk7sP/Dbg7N6+TfdSMprHU/R5tPuPDZ7q9MwSYVSwtuA==
X-Received: by 2002:a17:906:2a41:b0:9b9:f980:8810 with SMTP id k1-20020a1709062a4100b009b9f9808810mr15297902eje.34.1700203237894;
        Thu, 16 Nov 2023 22:40:37 -0800 (PST)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id v27-20020a170906489b00b009d2eb40ff9dsm447514ejq.33.2023.11.16.22.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 22:40:37 -0800 (PST)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/4] ABI: sysfs-class-hwmon: document existing attributes
Date: Fri, 17 Nov 2023 07:40:33 +0100
Message-Id: <20231116-hwmon_abi-v1-0-8bfb7f51145a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEKV2UC/x2NUQqEMAwFryL5tmAtuOJVRKSt6TagUVrUBendN
 /g5j3nMAxkTYYaheiDhRZl2FtB1BT5a/qKiRRjapjVa607Fe9t5to4UdqFvjDGf4AOI72xG5ZJ
 lH+XB57rKeCQM9HsD41TKH1YtmOlwAAAA
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700203237; l=1174;
 i=javier.carrasco.cruz@gmail.com; s=20230509; h=from:subject:message-id;
 bh=QXrfoCkqowTrn7dFYwnGzixw95ZtdozJg2Bowzx48no=;
 b=xCNHdBj9ugJ0HGfYsl2ODHJXgm2FWD+gG1bL+Wozas7dR+y+SkIIIopQjdux9NQ/VPEkmZlV0
 nSo/KPM3mmJA1JYYQdz2OsaJS4TQP3gaK0BU7ESIJceXr2MBPyxm+zr
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-Spam-Level: *

This series documents all humidity attributes that are used in the hwmon
subsystem and still do not have an entry in sysfs-class-hwmon.

Additionally, tempY_crit_alarm has been fixed to show proper access
rights according to its usage in the hwmon subsystem.

Three missing temperature alarms (tempY_emergency_alarm,
tempY_max_alarm and tempY_min_alarm) have been documented as well.

Note that there are no new additions, only existing attributes have
been documented.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (4):
      ABI: sysfs-class-hwmon: rearrange humidity attributes alphabetically
      ABI: sysfs-class-hwmon: document missing humidity attributes
      ABI: sysfs-class-hwmon: fix tempY_crit_alarm access rights
      ABI: sysfs-class-hwmon: document emergency/max/min temperature alarms

 Documentation/ABI/testing/sysfs-class-hwmon | 110 +++++++++++++++++++++++++---
 1 file changed, 100 insertions(+), 10 deletions(-)
---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20231116-hwmon_abi-e6f803337fcf

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


