Return-Path: <linux-hwmon+bounces-9081-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C54B2453F
	for <lists+linux-hwmon@lfdr.de>; Wed, 13 Aug 2025 11:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FE37189786C
	for <lists+linux-hwmon@lfdr.de>; Wed, 13 Aug 2025 09:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E452F1FC2;
	Wed, 13 Aug 2025 09:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="TguLLp/n"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AF42F0C4E
	for <linux-hwmon@vger.kernel.org>; Wed, 13 Aug 2025 09:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755076771; cv=none; b=cvPuofreBNr8BRIjQzVTdqwbZgyCh/YMO8wwmofem6Ca1lONO+XTze9IA1atJzwyAj3etGUJR9toSTsqEAPryuBkf4Aor8h7ZGY8e5kVbGnLbziHMxNsqhN6OK3jtet67PYzycttJplrn3ey2RfzDyvg9A0GiQt2aMmxsqvzLs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755076771; c=relaxed/simple;
	bh=RE9KS7cuU43JJjNboVBk1P9+sNHtAXUIJe2WGwF/bk4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s47SxmVQ8zJ8Led1QdvBQzrLt2hEZfuMPG4Vr/8eQ86p2VDEasbvcg69IhEAWEPSqvfJVzaTG+WEHqsTarQu/cRuQgcWnfAeRDr4Aexps+JVF6p5htBRMbfQS4m/7GNwvHIgd9XcYhiduXwAjvv0jWjvwYsI9bmlAdfRFIU0d7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=TguLLp/n; arc=none smtp.client-ip=212.77.101.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 33626 invoked from network); 13 Aug 2025 11:19:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755076766; bh=SxEkPZ6sFdsbquSppO3xBSWS65K8+YKlDLZyRqD0Qss=;
          h=From:To:Cc:Subject;
          b=TguLLp/nnHoFM28YkxDGcGneBLm4XmRiVFcjgwt0bZk+KPBbKoc1urHj7ESEecFPq
           rn0GS/8BWdRL3yyZN7s2IJ/tKfW/d6cMY2PXUDUkTQV8ZTT4g7OWYgXKqNftQ6mJsy
           ply5cxB9eBptX36GsGjtHVmFd90u+IW/nShAgS8z3pAjGs4IlxMMOnZ/ZsqR6u4bmU
           Ms5NV/Pc9zmFSO85HByoEeusuVxEOM8CjQvzVKFRtaAsf+3nIvYLN5w/ENeshlUnH+
           bzOYMyY4UMj3/IIQYe4yZ/ih5OH6kfirMvSr3BbnWNGVujZCrwJ177rl7GtWmmabaS
           fm5C/RGf4dfiw==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <jdelvare@suse.com>; 13 Aug 2025 11:19:26 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	fe@dev.tdt.de,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH] dt-bindings: hwmon: convert lantiq-cputemp to yaml
Date: Wed, 13 Aug 2025 11:19:21 +0200
Message-ID: <20250813091924.1075488-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: bcefb320436cd6f2a289ac2b1a250a94
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [gQNk]                               

Convert the Lantiq cpu temperature sensor bindings to yaml format.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../bindings/hwmon/lantiq,cputemp.yaml        | 25 +++++++++++++++++++
 .../devicetree/bindings/hwmon/ltq-cputemp.txt | 10 --------
 2 files changed, 25 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lantiq,cputemp.yaml
 delete mode 100644 Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt

diff --git a/Documentation/devicetree/bindings/hwmon/lantiq,cputemp.yaml b/Documentation/devicetree/bindings/hwmon/lantiq,cputemp.yaml
new file mode 100644
index 000000000000..5dbe1c631a34
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lantiq,cputemp.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/lantiq,cputemp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq cpu temperature sensor
+
+maintainers:
+  - Florian Eckert <fe@dev.tdt.de>
+
+properties:
+  compatible:
+    const: lantiq,cputemp
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    cputemp {
+        compatible = "lantiq,cputemp";
+    };
diff --git a/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt b/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
deleted file mode 100644
index 473b34c876dd..000000000000
--- a/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-Lantiq cpu temperature sensor
-
-Requires node properties:
-- compatible value :
-	"lantiq,cputemp"
-
-Example:
-	cputemp@0 {
-		compatible = "lantiq,cputemp";
-	};
-- 
2.47.2


