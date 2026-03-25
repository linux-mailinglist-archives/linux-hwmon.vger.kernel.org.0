Return-Path: <linux-hwmon+bounces-12743-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FqOKB+mw2lssQQAu9opvQ
	(envelope-from <linux-hwmon+bounces-12743-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 25 Mar 2026 10:08:47 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2701321E46
	for <lists+linux-hwmon@lfdr.de>; Wed, 25 Mar 2026 10:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FB563034A21
	for <lists+linux-hwmon@lfdr.de>; Wed, 25 Mar 2026 09:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3933033E3;
	Wed, 25 Mar 2026 09:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzO7Tryn"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C213345CD3
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 09:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429712; cv=none; b=SE4GDoG5tsabIpW6+g3dcXPm/1p20XC2P+Xguk0dKknK6lpUeC3Ac77twtPrRq6p8RKphzgGXpfUqM8JIQFZnmoY7RlP3YmaGFUd4HiZ2rGidn31gdAbophxXjL6GbmEiFEp5JfKe64dXScaDYAWc4b7vzJGcIO0e2OYh+HoS2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429712; c=relaxed/simple;
	bh=17vJldx190UtREN9N166r46Kt1uzxrxBDYAbNaVuqmw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Om3JhFwAXO2uKaJT5wKc+a4YEvCSp0hdILm4pQ4Y9Ut4uMdA8b0aCTDq9r5LRnUhLJsD+IxMuFqjB6p9RwdF8W+G3SfPGdGLzuhS5oNq6o3VN8eID2yhh5FhXlcsDK3nqN2mSQx80LG2XvZITxhd4ntYiuoivY/sl9TBNHRGlO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzO7Tryn; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82c20f1e890so3466020b3a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 02:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429710; x=1775034510; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wg4hmLMuZM7AMAh8JiXj2GkH4WkZAyqVPGv9vuptt9o=;
        b=VzO7TryniNyDptNOv2jJrKyr1BcPJmb2KT9Ns3ihCuzUMERdNMgiLE/+1yeNBOQJdz
         FmumaQzjG6y6YBf034EBD0UJrQ6KAgO9I8M239YX+0EYH2CK1FLUkTVLvxDqa0iPLTwm
         WrsnKlt74BVdQk0M9qENeFXxdeGTQAJT/W278E5G2vg86wMRL5E9oQaBTPZlwaJqn8YK
         igYpZFsuCMwPXCjWL+PUKM6FdAjt58Ji9TNbGFNRbiS7Y/CPEoJfMXJqDEJ/JrRChBht
         01VBgCSLmRyeimTCmx4+tURXLw69rl+PraWnu45IH7H0O07ZigvBVKRyMVkfSqi/Yl30
         Dqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429710; x=1775034510;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wg4hmLMuZM7AMAh8JiXj2GkH4WkZAyqVPGv9vuptt9o=;
        b=eZX7aPQEy+f8Sqe9m5g3r9J5tBhY56hHfha1CgSz9NIUGfRTg5luDKJLqb5Du1Im+1
         0biH2EnDyxM5mc+oRqm+qhjj+BeHZZ3HQWYFpvCDSR6YF5r/3JUBT7NEKFMwDAOl6JnC
         fXYWEwoieex9HoFhhTMEr1xYzGbQRlwTmWE5q7azzjvNxyZG6JXK8gQFZamxStb4vlh7
         RkZwcYri8XyutO5xKmtXIfMX1G4NJErSicJzYYGBeeOMWrBHqKLu21b+SifPvvlayePu
         7wESpNFKrVtWZiQqwhv535K1EOTBlP4fROgSCqBJVGgn6YeMeXhLRrKR5OippwNcy/Bs
         bULQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2Y3tFmRghqAr3bkjMh0ZN3l0I6v/UbU4VMEzTssxPNYmLePJOBkas8k9NmkfUIXBctqMIcFwDMbCMgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM+J8nsjk/NYAfYS5M1fNNQioH7FM+n530A88JyXg+6vKZKlfv
	jEZKWlVcfMRYqAG+VB850Pu8TOb09q/jtMcrPrXrwE/BCt0GtiRhFHE9
X-Gm-Gg: ATEYQzz2ZES53j8yhi8Qz3aiQ6xjx8hzlkibzv9+UDxNiEPH/iyNARct/8yIGIjNNN3
	8jNfWsgKZr6WXxRe3BH0SYYjuF4QwDxks10LlTWaunWmpTQuLZwZ1vpQsvAI6l7EEqJ+It7fnDq
	KcSo3lzdWZED+3q8D2ciKTn5KK1mYTrzzIZQkHhYJ2eCE/jqt71t3gQBVW9Y9QpcaQLksKaB+aA
	SgFg2H+vl1hYpXkaujXWa/FHs5OwF4GNkb93ImE1cvBEVLnb9pnJD1GfhUoEsKB2OxdsUGHKwfm
	0x5cRz/ihT4+9PHuk+Ic2NDra/ZFhfNN0+8prrR3l+0ul6MRge75rFJeDPJzfrZNfV7K9cXkfyq
	L7vpMO91WR4FL1cDfNBlxaw39jhKOT4t4EvXmKOYtAPR8qS+rg7BM18EJuAYD2q/If/6mPpc66k
	rasfLTrC4fWtrVnPIxSs2CSczu3K6WwDX7ZSQB2T471x4+4QVAgZN0EBe+Ne7q1bA=
X-Received: by 2002:a05:6a00:3c94:b0:81f:3cac:38a1 with SMTP id d2e1a72fcca58-82c6de82b8emr2967488b3a.6.1774429710460;
        Wed, 25 Mar 2026 02:08:30 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc6881sm17476982b3a.22.2026.03.25.02.08.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Mar 2026 02:08:30 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v4 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Date: Wed, 25 Mar 2026 17:08:08 +0800
Message-Id: <1774429690-129139-3-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zaixiangxudev@gmail.com,linux-hwmon@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-12743-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.44:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: F2701321E46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add YAML devicetree binding schema for Sensirion SHT30 series.
Use fallback compatibles for compatible chips and add optional
interrupts and vdd-supply properties.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202603212044.BRPaiz86-lkp@intel.com/
Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 .../bindings/hwmon/sensirion,sht30.yaml       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
new file mode 100644
index 000000000000..1b5ce822b37b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/sensirion,sht30.yaml#
+$schema: http://devicetree.org/meta-schema.yaml#
+
+title: Sensirion SHT30 Humidity and Temperature Sensor
+
+maintainers:
+  - Zaixiang Xu <zaixiang.xu.dev@gmail.com>
+
+description: |
+  The SHT30 series is a family of humidity and temperature sensors by Sensirion.
+  Compatible sensors like the GXCAS GXHT30 are also supported.
+
+properties:
+  compatible:
+    enum:
+      - gxcas,gxht30
+      - sensirion,sht30
+      - sensirion,sht31
+      - sensirion,sht35
+      - sensirion,sht85
+      - sensirion,sts30
+      - sensirion,sts31
+      - sensirion,sts32
+      - sensirion,sts35
+
+  reg:
+    maxItems: 1
+    description: I2C address (usually 0x44 or 0x45)
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@44 {
+            compatible = "gxcas,gxht30";
+            reg = <0x44>;
+        };
+    };
+
-- 
2.34.1


