Return-Path: <linux-hwmon+bounces-15877-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HE1sB4XxVWpdwgAAu9opvQ
	(envelope-from <linux-hwmon+bounces-15877-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 10:21:25 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B25F5752545
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 10:21:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=pWQoZ+lz;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15877-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15877-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D82FE3022D82
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 08:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E040E3FB7EE;
	Tue, 14 Jul 2026 08:21:16 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205613FC5B9;
	Tue, 14 Jul 2026 08:21:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017273; cv=none; b=Wk7j7FthfeqRk/1JmKF7BSH+w/LGQDb43J/p7iJZ214V/a4jngGBlhALg/sgpWLOJgonMowgyMRn0q1S3IuH7IqovOmIxf1xZqL2n5pg4+ScaDLHIJ6VTZ7ONmgW/IIesS8hmJkFrREJwHrMSM8ILepUb2oJ/35KmZaTQmmHHvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017273; c=relaxed/simple;
	bh=awbzImwgwevD5B+WPMxw/mtoevlgiKoZ2ZmXSNjFfjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ozXKj2p/FkMQifQ22m3e3rlApbIGM8VXokMlXb0m+nJf3yfpUysQGaWLfRIXF8wozzkXIZkh1NfvN1rNlgCYQ6WoQs7L8wFBBqrOm99xNkSKpuK3dQtEvSlTCfI3JDjnPuvCOkPSfe9Wg+5RUwr284WS9sJWGiPcL2fzAuaRWDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWQoZ+lz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49F6BC2BCF6;
	Tue, 14 Jul 2026 08:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784017271;
	bh=awbzImwgwevD5B+WPMxw/mtoevlgiKoZ2ZmXSNjFfjM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pWQoZ+lzVjQrc40QTZ28nBJNFfQ51BF8Ni1y0VZpzD579aJZrI2kH3V0EToPJJgGd
	 gW+9eNngOD7LwGbcN+vekD9E4MRZcJcpUZ/fkJDj6h9WVu/ry4BI+Fo/HvcbTCiFkP
	 KkHTrVyt0p97L/1iKTB4q8F3VSQjzGB8qXvrXBqZxgdLPufTt4qbbRc9tTE135J9dN
	 H/SWFs65hTEOMb8vwPW/idVQ5GWHcEU5GnT/tpowvnLG4WEU8q680Sih/jHsc6tMVn
	 bcculRSfEgvifcj3cxzoahxO02r0WD56iul7b0cEuZ9x2BkiFv3DVFYw3WKGAUr6tK
	 KldOJ3qYy2ZpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29546C43458;
	Tue, 14 Jul 2026 08:21:11 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Tue, 14 Jul 2026 16:19:33 +0800
Subject: [PATCH 2/4] dt-bindings: hwmon: Add Kandou KB9002
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-kb9002-upstream-v1-2-8fd2f0b135d8@amd.com>
References: <20260714-kb9002-upstream-v1-0-8fd2f0b135d8@amd.com>
In-Reply-To: <20260714-kb9002-upstream-v1-0-8fd2f0b135d8@amd.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Chung <andy.chung@amd.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784017234; l=1681;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=sULzoCWER8/kQnyowJD1BDPPGQySh69msij2k9XFp+Q=;
 b=8zJAQLtX0kZC4kdR3dcLh1flHMfVeEaL72dbEK0awPhGacrTeMmXHFgUReYt4vLQ5ceUvmLwn
 XAY7qVIeBCICfNHTb4wz+vqlVXwlZnQngLsPV1dZfRDsUo26PfLU5wt
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15877-lists,linux-hwmon=lfdr.de,Andy.Chung.amd.com];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andy.chung@amd.com,m:linux@roeck-us.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:Andy.Chung@amd.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-hwmon@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[Andy.Chung@amd.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email,amd.com:replyto,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B25F5752545

From: Andy Chung <Andy.Chung@amd.com>

Add device tree bindings for the Kandou KB9002 PCIe 5.0 retimer, an
SMBus target that exposes an aggregated die temperature.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
 .../devicetree/bindings/hwmon/kandou,kb9002.yaml   | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/kandou,kb9002.yaml b/Documentation/devicetree/bindings/hwmon/kandou,kb9002.yaml
new file mode 100644
index 000000000000..67859e9d63c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/kandou,kb9002.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/kandou,kb9002.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kandou KB9002 PCIe 5.0 retimer
+
+maintainers:
+  - Andy Chung <andy.chung@amd.com>
+
+description: |
+  The Kandou KB9002 is an 8-lane PCIe 5.0 retimer that exposes a
+  firmware-controlled SMBus 3.0 target on its sideband interface.
+  The host can query the aggregated maximum die temperature and the
+  running firmware version through that target.
+
+  The 7-bit SMBus address is selected by three SMB_ADDR straps and
+  ranges from 0x20 to 0x27.
+
+properties:
+  compatible:
+    const: kandou,kb9002
+
+  reg:
+    minimum: 0x20
+    maximum: 0x27
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
+        retimer@20 {
+            compatible = "kandou,kb9002";
+            reg = <0x20>;
+        };
+    };

-- 
2.34.1



