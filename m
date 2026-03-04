Return-Path: <linux-hwmon+bounces-12101-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL4zINQGqGmEnQAAu9opvQ
	(envelope-from <linux-hwmon+bounces-12101-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 04 Mar 2026 11:17:56 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2588C1FE323
	for <lists+linux-hwmon@lfdr.de>; Wed, 04 Mar 2026 11:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3E5A305261B
	for <lists+linux-hwmon@lfdr.de>; Wed,  4 Mar 2026 10:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E623139FCC5;
	Wed,  4 Mar 2026 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bU401EyL"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A4534D907;
	Wed,  4 Mar 2026 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772619430; cv=none; b=fXltELnHrq6HgQx6FDH1afI71bS/gLc/o+cMJZ4kt3RHx+JuSP3z/WnMIDeazinfV6k+q7UnfzMxTijDQRNzPdxJ1s3fx4cklmFcAMu6KC3tB5T0Xz+rKoyyyfj+8ucAbWBaBiIrUteCOH4a/Ov0z14cXFCkO5MvMIai6hltR2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772619430; c=relaxed/simple;
	bh=GyiIZCoxRRp/uGhPOPVKST1Kfcf+hq2zesY60smmkkE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IEGdKbIRQxAP5hyaNbCp/zE2P/x6WBr1ZhvHX0dUb3xFyGSPeCJO3niquXQVbCtedY6jGhxXZughRU1INKML2N1PrfZV7NRs6BsqQsB3brVdO6amyoPpl6V3azIfCT8bVX0jv+GerV4OI4KK2RYIfhrdY6xigziWOml5+Xl4Kck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bU401EyL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77936C19423;
	Wed,  4 Mar 2026 10:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772619430;
	bh=GyiIZCoxRRp/uGhPOPVKST1Kfcf+hq2zesY60smmkkE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bU401EyLje/arwIEiMLSFWX9MoRriiISbsNzlKvPq2KQr/bFwnr9s9EM7SATulLcC
	 pLIw58u1lID4qwOk3RY9J8hC/jYcV95+6SLrIWBK8wLw9VqxwO1eV0+54pHrZKWDKB
	 pSxwIIXZtQLm1gpUsZaEZBmXFjkvEemANZ2O+Z1w7w6LSFo3iqP+4YZ+LE8r8QSy3x
	 Gl+kCIHJoXizcLVvJwJMVaLv+93NZu55+gojmxLlby6Ntt2fmYkqPgdrerYxJi1hB5
	 YLepXbtoFCY2FgVSZVuIcY2+AdfuZdWUtVW2N3au0dG+4CcEKKqq1t9lWBtByrIq0H
	 XTTRa+vk772fQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631FFEB7EA5;
	Wed,  4 Mar 2026 10:17:10 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH 0/2] hwmon: ltc4282: Small fixes and improvements
Date: Wed, 04 Mar 2026 10:17:46 +0000
Message-Id: <20260304-hwmon-ltc4282-minor-improvs-v1-0-344622924d3a@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAwAwK9IzgZqrFX8iuxB3KgB20oqriD+3
 bLHucwNiVU4QV/coHxKkhgyqrKAaR3DwijfbCBDztTG4vrzMeB2TJY6Qi8hKorfNZ4JG0dV2zh
 n7NxCHnblWa7/Pnye5wWZ1jCbbQAAAA==
X-Change-ID: 20260304-hwmon-ltc4282-minor-improvs-5621756604f7
To: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772619475; l=750;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=GyiIZCoxRRp/uGhPOPVKST1Kfcf+hq2zesY60smmkkE=;
 b=+gwvYRVWbzYZsGFPtiJeT8liks7cQyjV4IyJpGBSofuwrko+cn3BtLL1KaIb1sRyLzpwYqIuH
 Y0DFpr9g2kACzmlbZZJhGSSjErsnsEx469802Ffa8aDKYe3g6X06ara
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com
X-Rspamd-Queue-Id: 2588C1FE323
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12101-lists,linux-hwmon=lfdr.de,nuno.sa.analog.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[nuno.sa@analog.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,analog.com:replyto,analog.com:mid]
X-Rspamd-Action: no action

Small series to remove scanned addresses in the docs (given there's no
detection being done in the driver). Also, in hwmon, we do want to be
able to probe devices even if there's no firmware properties
(description) available. Hence, make sure we do not fail if there's no
rsense property and define a sane enough default.

---
Nuno Sá (2):
      docs: hwmon: ltc4282: Fix scanned addresses
      hwmon: (ltc4282) Add default rsense value

 Documentation/hwmon/ltc4282.rst |  3 +--
 drivers/hwmon/ltc4282.c         | 15 ++++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)
---
base-commit: 78558965440b27814592ec82d8f3668395953b1b
change-id: 20260304-hwmon-ltc4282-minor-improvs-5621756604f7
--

Thanks!
- Nuno Sá



