Return-Path: <linux-hwmon+bounces-6723-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F24DA3A360
	for <lists+linux-hwmon@lfdr.de>; Tue, 18 Feb 2025 17:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50F0F3AA277
	for <lists+linux-hwmon@lfdr.de>; Tue, 18 Feb 2025 16:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8144326FA54;
	Tue, 18 Feb 2025 16:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="YjXRg7eb"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE6526F460;
	Tue, 18 Feb 2025 16:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739897816; cv=none; b=TVAB8SYM6l/hiQEUoBbmYExDuyA0Tsm4RPcp7SCvsDylL3veyeGFhy+wR74jDxfvfa6UdgjgYRYdYGcryo/m47otAah+KdbdeZ44GBGSlfk0nJJ6X6O4R4sAw0VRutpNU26dsKg9qMi5L9YwDy4Rm0mFgRghjcydY1A9buYBLXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739897816; c=relaxed/simple;
	bh=rKvDw5wtuYHWU3e1OcsOoPwrl9pmH/9EMw62UcthRSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C1nKoHHKHo2PIGXlQcrzIgWYU/2do3W9mg+/Rqn6KZHyF5RlMbkNh3NeUjmuySvwB1O5oFvhfu4KndF6VoaNrCESWMHtMWLPRrrYBR0EOJDgsrYV7/ZgA8lMwxfhV/XFemnuAPqsYrXf0pzQHYzGE2/il6KRbfcslR09hAH/e1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=YjXRg7eb; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.corp.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 836EF1FDF3;
	Tue, 18 Feb 2025 17:56:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1739897805;
	bh=I9R3Gv1VS98WnaBu7nk5Kx6V9mGcLENs9dhlusUfHoY=; h=From:To:Subject;
	b=YjXRg7eb9qyfTYxIr/QfCQnVOvYJMpQUtTv6KJ7S48nJJ2j5DStOzCzulL7mIafXK
	 AyPcrWWh6x23It6WPGjE+yYnfpcSn2Ww/vkvQN6Li4zTCPZzrjYBViVywRHNgBs7YY
	 KDIfwK18yP0oyOdzyYt7DDZDw6lp5MndDjPxmZohSHomEy4K4jhmnpK2pWueOzuQlq
	 lZQ7RCGG0xo2PZxb2iBvnfgB0ck9VLN19p2ZilP7AgXqmhUiIaV5NbvouVBLxpy4p5
	 CugVCezHtuj4Hlbwb3hsQP8JqtaAargNocA7a91z7iWxTE1phslfhcFXb+JVUPTlDu
	 RXPLppNc1H8Yw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: hwmon: amc6821: add PWM polarity
Date: Tue, 18 Feb 2025 17:56:32 +0100
Message-Id: <20250218165633.106867-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218165633.106867-1-francesco@dolcini.it>
References: <20250218165633.106867-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add property to describe the PWM-Out pin polarity.

Link: https://www.ti.com/lit/gpn/amc6821
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
index 5d33f1a23d03..11604aa41b3e 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
@@ -28,6 +28,14 @@ properties:
   i2c-mux:
     type: object
 
+  ti,pwm-inverted:
+    type: boolean
+    description:
+      Set to make the PWM-Out pin go high (with an external pull-up resistor)
+      for 100% duty cycle (suitable for driving the fan using a NMOS device),
+      when not set the PWM-Out pin goes low for 100% duty cycle (suitable for
+      driving the fan using a PMOS device).
+
 required:
   - compatible
   - reg
-- 
2.39.5


