Return-Path: <linux-hwmon+bounces-12715-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ7xD4mEwmkAegQAu9opvQ
	(envelope-from <linux-hwmon+bounces-12715-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 24 Mar 2026 13:33:13 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D09A3084B9
	for <lists+linux-hwmon@lfdr.de>; Tue, 24 Mar 2026 13:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E135830516AC
	for <lists+linux-hwmon@lfdr.de>; Tue, 24 Mar 2026 12:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7CF3F789A;
	Tue, 24 Mar 2026 12:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sqjbpfa5"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9953F7875
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 12:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354897; cv=none; b=mamIUDJPluasaodDXz2vtvSFhdgaulbSFDUw+M/iLEoLQLN1MOKYzGmP2e+lcPrVFdq3k5K7Y8MtQt6szswh4ahtuFKxIDcNwLDed0iFWIasS9di4h64lstCUGzy2ww6w151lIBYS049KIvMF6GwWvNx8rJdBaHDwK6T2glB5xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354897; c=relaxed/simple;
	bh=E+dbXB6xz43NwBCyouCYRd6qQtOa2PkfyCfJxIDZV0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=H347R//tgY3o/VcighJqgm6y46oEZmtgItMNdywpUaBH9hKqieM/SpaXwZhaKoLpffJFnr9CfGF2MliwpKO6dc/O2Vxe2dq2r3BzQJj7n3JOWBlGl9Xw4A0zpQRdp/6uItWjoLn3cxCxjGyBP1zG7AzmXbwpVpiI20WIVLV6Rfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sqjbpfa5; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c742882d2a4so1631008a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 05:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774354896; x=1774959696; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BpCh7fwsnHP9oYgpatK1nkKb8PCIU2zv9cH/KH380ZE=;
        b=Sqjbpfa5MRtK6ZY+LNz5dC1gPin7yLlMmsK47cBI3HVXhrrVkU3A9yWZWkaijdnXtA
         snN5BR5dB2GZV9R4pgzBCC9LBsPLG1Bmr1HHMMFOyIiAzEOr3wwuEsqW5OcSWEYrrC95
         p4VPYz3co72MDRJyxLTJGOF8XtEfbBrBy8BCabJHSAzlcNrD5OybSf0kKHcwclfWadVg
         EiXNSFuqbcFvg9EDz6p5C14/YVfpVQSeHBAvgc1/cJ50QMiCOI2fJ2XZ9frfR0DLhP4R
         lstyRWwPT1HftxvgP3WG45lUgdiTtkeP6HJA0F6L+VeWjVQ7px6c8UdewC0fAmsxXK84
         VuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354896; x=1774959696;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpCh7fwsnHP9oYgpatK1nkKb8PCIU2zv9cH/KH380ZE=;
        b=qZMA5SqayfV5yuV7ovuHT4Ytu6yVCoM4svazjX/IF23B79Gs2MTHj9C4kNH5mIxvw/
         ojLhnDOzxfXoHXdo32IxVDf8P17amCBBXuE5hK5mY76YDChTVJVzsqUKWmUzz8E9/qmR
         BzJ2UK0pPZkUKsEBSqUN2/0CLNF5vF369IpxO5wy8pJFF/KjqPMKgg+uuoUZIhYGzH6C
         kH6CAxk8BPuKCfqFTnzisLQUxgvM6EAldspGMAkNRhHc7kA6GiNz7NLduZ0gCIbCWsJX
         VQatob2wrfxvgDvseG8DrawNEaQrAgKfhfd4JG8zRsRI1ZJrI+0UxyAZ9RUN1gjNhkLu
         xVPA==
X-Forwarded-Encrypted: i=1; AJvYcCUTZpk+XWLbLCAVoIXKN2FolK/mS0I4XCb2sA0MB0sDbYpgnhcdAPXhLrw9GjsGajbxcK04tN32IBUzZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBMZ9XkE2p7VgvAKA8U320v7bzM5aib3c1dWmAs3t8dRhL5VV+
	YPR8Em8MFERupbj9fnAG8OpXcwxGy0UZ6imkehn8uZWkr4hu+pjo44pu
X-Gm-Gg: ATEYQzw60LBnczpyG4tXw3x/O6QjFmpS6cFAaOt8KNFCBguSihyB2eN0gIM7K7hKyng
	ci5VO5MbUUjusV0AGaHg8/kwIhUmzwu8ADtLsvJ+Oz4g+TJp+BzWS2vkemiMdx1R/niCWppiatU
	obaecBBasGJ60sSu0vqDeLfd0IWQJx/SZZ/PrE9vpivnRvEMTXmfB8ow8zxjUsSHs/f2RwnzsXJ
	P9+WEAhtQ4Z1PnAw+wLkUzccKzRdYAD3VzYCk/K5B7NyC80ebkBadQVXwVUh4jWxqCpp21gED8V
	Y4c6/qc3ShrtbEXiSQD5utE9nFYaxLBowPOKkF3WG+WAbzocxkPkfdXQ3WyDFdXSMjlLL+jtxOt
	gadHFeaj/j9iY4HHEx1Byfim6EWa23c5DtxwNkAi93VI7tU2nH4hpsJBhkHVlWOPfMepiGy15b4
	4cDaSecglLsMTRNXxa+M8frz0fmOi1iktuWmaQqhNomJt5RhoYRHib
X-Received: by 2002:a05:6300:8b0f:b0:398:a440:e3bc with SMTP id adf61e73a8af0-39bcec340afmr13199275637.66.1774354895804;
        Tue, 24 Mar 2026 05:21:35 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74443ccbe4sm9904920a12.22.2026.03.24.05.21.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:21:35 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add GXCAS Technology
Date: Tue, 24 Mar 2026 20:21:06 +0800
Message-Id: <1774354869-119736-2-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[zaixiangxudev@gmail.com,linux-hwmon@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-12715-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gxcas.com:url,microchip.com:email]
X-Rspamd-Queue-Id: 4D09A3084B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add vendor prefix for Beijing Galaxy-CAS Technology Co., Ltd. (GXCAS).
The prefix was confirmed from the manufacturer's website:
https://www.gxcas.com/en/index.html

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..354836eb8e72 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -676,6 +676,8 @@ patternProperties:
     description: Gateworks Corporation
                  use "gateworks" vendor prefix
     deprecated: true
+  "^gxcas,.*":
+    description: Beijing Galaxy-CAS Technology Co., Ltd.
   "^hannstar,.*":
     description: HannStar Display Corporation
   "^haochuangyi,.*":
-- 
2.34.1


