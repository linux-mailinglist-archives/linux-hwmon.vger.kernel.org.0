Return-Path: <linux-hwmon+bounces-11515-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHlZD8pbgGlj7AIAu9opvQ
	(envelope-from <linux-hwmon+bounces-11515-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 02 Feb 2026 09:09:46 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC6EC984F
	for <lists+linux-hwmon@lfdr.de>; Mon, 02 Feb 2026 09:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5365E30036F3
	for <lists+linux-hwmon@lfdr.de>; Mon,  2 Feb 2026 08:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D983101A5;
	Mon,  2 Feb 2026 08:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jT5SRtLv"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4202A2EC56D
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Feb 2026 08:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019464; cv=none; b=PHFCJrf3n30xb3XlV082Z8XzrNo8mnD3Bsf6gokuffOhfbthNK0SBzjDjAgQH7AX89wsTc159QXAP29537BpxYdjI03lF3s+4NM5Vn21s5hT4pMbpzlrXXqEPSDGaZdGfdhJWgZ0cVg40ikpyRIFiZFCpSNCjnFULX+0Wtcaevo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019464; c=relaxed/simple;
	bh=qgLBIL+tVd3BOMTOJ5P2zLXCeOGKusAisKau5Fwy83c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nl2qt5S81sEa9jUPF3ddP9hIEYN2bDUdZOTSUn5QiPlTd0Gju259GiaeYahh0RQrIena0WSSorkC61KSP17MJU6eJHfAGXYd7lMdQijjJ94SZVfE7B6AGALVBtNbZbA0ilcqNdXaC9bOTGsf3WQqTusHUd+UQB2keJHxPQdtTBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jT5SRtLv; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8231061d234so3502167b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Feb 2026 00:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770019462; x=1770624262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eUsxoJZPqPWehI4oczzdZcvy6JNiZ6yXW1G8GKE3HQ0=;
        b=jT5SRtLviOyp3cuyXm2oFgnjlyHAgmaKrE/pOFFavu59NZnxguH2dJYqerQ4MHYM2u
         uuObUeq3s5YwwEukhitVQ2TfCgqI9yVCueNtVUXH/VGACuH6jGhnA7JStmqWrVlEyDvH
         HY2ieawEJXryhhlX4FL6JPeYrztJch/uwBfIvStIsatxYzuPHKaAVzH2iDDH6yM4IAH2
         I81+zL7GPILMvK7m8QKj8CnB9WX51jrQVlrFvmXhcFd3b1ezT6x9qnm+YaTCnTdBCjmz
         Vxsrqv1yp7JJ2IshYXAsHXVPx/N0a2W0wapVii9sUxOXcAdDmNUWjvai5rsfThlz7Poe
         1bwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770019462; x=1770624262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUsxoJZPqPWehI4oczzdZcvy6JNiZ6yXW1G8GKE3HQ0=;
        b=Ja8NcbJYYsJzjPPO9t5qllZxH90lrXVNp9WYgiqB/Fj4A5cZDsHL1XLM1Vfe7mrexe
         c4vzyIVn64LItozug/ouHZSELgzJXxKaRIPdSyDAd+roW+uV2Z/Eg8BQ6NSGn20hVA6x
         iPuxrguWzO2ulENvQhwlO2FK1oRJ6yOL/acyxsZPZejW7xoA/UpRubJMD2D+00JJ6UAC
         BO+NUt2GhYTqFtxK0v1sEbopUjNa7MXAO5tEwvJFKM9+JG5Vg8KUU3hW7d+fXpotEvfa
         YCOUOzRXtgMHt+fajGYi8treRsM07c0IFqZuvz14AAeTBIrJ1XzGecb5dZgCmDa34wA8
         LDlA==
X-Gm-Message-State: AOJu0YyfhcAdCs/V/WZIR6c0NdQkKhV0jI3GFasIQ4btR10LP2uVbBbn
	Nm0EYiTdMSXFUrMaSDxZ2VYYu+XgYRp3lR3gk3t/PFoy4Vt1m4MSZrtCaosC7QEl
X-Gm-Gg: AZuq6aJv4XlovPH6yoZASPV08CBGRLxizT2S4kcjDviwOWECgb/asg9lcuUqae6g2Tl
	WCaYGCuJFCUxlKoBSiNmUUguLTsL/i1Z7Sj2TCbrCkxflCLQ1bjBkYcQzm5iqXDpuYs98yyVGJy
	mPJOV2oq+cXv5TWDvu/itLYYKyX+iFEvI4OK1kXiEVJIT6//fuG0BQ90u7aSZ3YsixtkmCHOP55
	IRii/Q9Rc3+rtYP5bT4dQoMWcHrBkgcql7tWi7D0neUEB9caxwBpc0Lbflc6ThnTT7Z10T0O62O
	CqPve4PABLyTzISzOrQUQb3jBfC2TSW/JKFwcPY3vyZK6e7q0zneIlPqRBtI2Bz6ZdwBZ/Kdczf
	4Gg80TeW5y+MPX/aNwRBy5oqiQYcIo69t9hsAOnEZc7XH60TC+xsw2ypEXyfVr7713ZUvTuNM64
	JzPOO39EZ84WrZm5TaNbMTfFELm2jM5DRprw==
X-Received: by 2002:a05:6a21:9082:b0:366:14b0:1a3b with SMTP id adf61e73a8af0-392e01a7bfbmr10651804637.73.1770019462403;
        Mon, 02 Feb 2026 00:04:22 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:61bf:a770:ed27:c783:3591:cfc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a3356b4sm13596938a12.17.2026.02.02.00.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:04:21 -0800 (PST)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH 0/2] Add support for Infineon Digital Multi-phase Controllers XDPE1A2G5B/7B
Date: Mon,  2 Feb 2026 13:33:53 +0530
Message-Id: <20260202080355.53061-1-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11515-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ashishyadav78@gmail.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infineon.com:mid,infineon.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BBC6EC984F
X-Rspamd-Action: no action

From: Ashish Yadav <ashish.yadav@infineon.com>

Hi ,

These patches add support for Infineon Digital Multi-phase Controllers 
XDPE1A2G5B and XDPE1A2G7B.

XDPE1A2G5B controller supports Linear Data format for VOUT using VOUT_MODE
command.
XDPE1A2G7B controller supports Linear and VID Data format for VOUT using 
VOUT_MODE command.

In case of vid mode in XDPE1A2G7B controller, NVIDIA PWM VID vrm_version 
is supported:
Vout = 5mV * (VID-1) + 195mV

With Best Regards
   Ashish Yadav

Ashish Yadav (2):
  dt-bindings: trivial-devices: Add support for XDPE1A2G5B/7B
  hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g5b/7b controllers

 .../devicetree/bindings/trivial-devices.yaml  |   3 +
 drivers/hwmon/pmbus/Kconfig                   |   9 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/pmbus.h                   |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c              |   4 +
 drivers/hwmon/pmbus/xdpe1a2g7b.c              | 115 ++++++++++++++++++
 6 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwmon/pmbus/xdpe1a2g7b.c

-- 
2.39.5


