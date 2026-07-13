Return-Path: <linux-hwmon+bounces-15858-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /SdnOuCYVGpIoAMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15858-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jul 2026 09:50:56 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4553C7485EE
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jul 2026 09:50:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="RkZqTAo/";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15858-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15858-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E58EC304635A
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jul 2026 07:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CED63932EA;
	Mon, 13 Jul 2026 07:46:27 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2702D38F938
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 07:46:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928787; cv=none; b=eLzruZWQ8dr/3zFaozB+TtsZiFj7XHdf0lIsiWy7g55sFaDLXl0leSm+Z0zIYQxSKJNZyafSFPHfwu9qeLW7PDruRRA3+I9NmmXzXh5TjOKhgck6GAgYTQMJ6vLV/W79lzaF8jLAM0buGnWZvYlkX7PG7giNmjyaBLkhzXx1Hq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928787; c=relaxed/simple;
	bh=uZJrbkg7J99fCT2/aSoWztc3tcIfDWx56O7WqR7T4H8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gL9L9E2JndjMd+CWBIAzqeoRXEexp/JIM+YJ4x0M5kxoD5oS+xQjOMsJkiJtNPdvUyHHRxrMFwhW5UnGM4OOlk1bV61uzC7Qgf74QJ5hdenXHvZqeexEmMgGDj4IqI0n0TWpjsvtWno+EiPS6uB8X1BdFR5NFhB1bIhbdxK+2cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkZqTAo/; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cacf197759so41419445ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783928785; x=1784533585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glibjITTE+gwoAFMIgjUwWiYRTlSKwkyNuujoaJcwA8=;
        b=RkZqTAo/nQd/fIRr5c/d8dnOoHVHtJ+1socqMzBx5PkuR4Nx0p3Q62Oww6G18iMPcL
         EHgZ3b9fxF+hdg/xH2W+NP8qFV/nXoMsc5VOl03kOkw2CBlOCq6E+CaRun6ZO7u4Oisp
         KYMWZgWJZhf1Eo3F1GG4NEqK4ROjnY4I1xVsnychHVTlh0gBpBNYc84OZ585h1B4xNPT
         VzhsQiRJ12mv4sU6qdXzFI1+TfntJRIVYwnhuAdFyngOQuYmwDZCTsBbINLh4ocK26D9
         v26Bv6iMh7CyjYrHe4VnpejVpGKGRV7N89blXpxdcnxRedDzmSRSK6FYzxjhqmheKFRK
         zF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928785; x=1784533585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=glibjITTE+gwoAFMIgjUwWiYRTlSKwkyNuujoaJcwA8=;
        b=KztuzcW3g/T8/tR4mQOYwfnBjeM4VHOWqbGLScNwO2Y8XvXAd/dQEdZMEku+OV1f5W
         ZwNiSB2t2FgArv3KOp9AEtq/EaUdtmBmaR0x0EGPP46/a6a9sTB6CCaIhJQyBu3k3PiN
         RHt10lw/xThRFKpSGRn/j2ckCCYFLTxBhyog1dOZQV2eqSKInxtaIpK0/6gWrsNiqU6y
         40MsQAFeJu11rk62pEZWSW/dMI5gMFF1VP8JFQipptV1kwh04I/jjBYUiYCQtoIINiso
         yW0JwlS/UkSUGY+u/hIiqXxZQczcnt0Y/fT5yr//8yT6cY7kub1GtoW2XVhmPjwtODlw
         KaGw==
X-Forwarded-Encrypted: i=1; AHgh+RqPQ7RvdV2Xx32WtYbExLoOfXzBt4jYqHCs8LvaJGAPhsq3E1UQhaQlQHkx/VKAo8bLqF9fOkM9SDq6ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKj7YhyyjMSqHIXlQ72IBpKAGRx1Y/0WUnKHCaVWnQfJa8cNu5
	UuiiqHM0WA9xi1PJ3FMG0mqstQXcNmw8qicoK7LjUCUs5TFAM8AkRnef
X-Gm-Gg: AfdE7clbvybQz0laB0RR9P2CphgRfOMZOG68zF7x3Qym5QfySErEiWSK0CN2ReDAo9Q
	fuodZHohwhaJwuvSUeTipqfPTOVmU/ftFAP0HXN+sH4h+9VHypv8De069wUSko1jnJt2YB8z+GI
	lXHauVPrGGt7Z4iWHFUeELK8y06v2j84hLJu+Dsm2d+2zt0QRWCt3fFAAm4Hlai3RVp8Q2OMTHr
	GryUdCrBviVaa3bxtFjj8rm+CX8qcNkpgCGigJ1IwBVX4gKJDHCU2AQHMfaXOSQysPrISCARJTu
	HVMRfmdPRTL8o9VwPHP97WmHfcbc/YdDI08//n/7FCDJ/HbsvUPAAQlOkppOpZStH6EwLn/j9oT
	xfDOUDM9MC9kdJyqv7/ZxpMq+0e+dYrUIvT/0mioTF1RpMW7IfgJzPp4w6k2XNv3Afxdu4OL+Rl
	Ihw5jcZLICl2pp/OtNNUbejg==
X-Received: by 2002:a17:903:2347:b0:2c9:e961:d256 with SMTP id d9443c01a7336-2ce9ec0f113mr75173525ad.27.1783928785568;
        Mon, 13 Jul 2026 00:46:25 -0700 (PDT)
Received: from HP.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bde9sm94960105ad.79.2026.07.13.00.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:46:25 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zaixiang Xu <zaixiang.xu.dev@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/4] dt-bindings: vendor-prefixes: Add GXCAS Technology
Date: Mon, 13 Jul 2026 15:45:56 +0800
Message-Id: <20260713074559.12196-2-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,microchip.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15858-lists,linux-hwmon=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:zaixiang.xu.dev@gmail.com,m:conor.dooley@microchip.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:zaixiangxudev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[zaixiangxudev@gmail.com,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zaixiangxudev@gmail.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,gxcas.com:url,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4553C7485EE

Add vendor prefix for Beijing Galaxy-CAS Technology Co., Ltd. (GXCAS).
The prefix was confirmed from the manufacturer's website:
https://www.gxcas.com/en/index.html

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..6793125d6cc6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -692,6 +692,8 @@ patternProperties:
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


