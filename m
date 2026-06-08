Return-Path: <linux-hwmon+bounces-14863-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aSUqEvu9JmqCcAIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14863-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 15:04:59 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4416566B9
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 15:04:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="rISwU/tW";
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14863-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14863-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 609663020128
	for <lists+linux-hwmon@lfdr.de>; Mon,  8 Jun 2026 13:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5632F39B4;
	Mon,  8 Jun 2026 13:04:32 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE812DECDE;
	Mon,  8 Jun 2026 13:04:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780923872; cv=none; b=aSt8XsTXd925pLmKg+QL3LC/b5Xx41/7zK5e7L+MdWftEtw9QVECa2ROOcuV0YT4N1xFgUshBml0ksCNuLc3Rgp8PJiB/38EvJxcmoT9d4yValb9ZhnzUYC99Bjo/ElqPkDgsDkbphv6ufYm02M9MVhlbAkdsqCdrOuxe2pC3PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780923872; c=relaxed/simple;
	bh=knZSIpSnPyE8xSKnsSBICwc7zFH7EviJsK2ZsdUIYnE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k8qmXS20A+kHib8gcxKrbi3ruJUtJLQMcB4KydKaatB5PwFC4Klf6JLZVmqEhk/Be1eWUhLmM0E+EYRASTO5KRUizYp3iJ6lPJWf74CEsfKsztnRcc35IQWGQosECJ0ogIi+ttfCeGCKWbyiB4nxX1NBWUwN+1x8ShlIhW260xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rISwU/tW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 132FAC2BCB0;
	Mon,  8 Jun 2026 13:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780923872;
	bh=knZSIpSnPyE8xSKnsSBICwc7zFH7EviJsK2ZsdUIYnE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=rISwU/tWKJr9ayrMHDqlBuAtj95K6grT9KWL+pfdkw9bStIG4Us7SUDTCL/vS2LUJ
	 BlOFauBPiqy6Pvm18Q+JrlnhptZbug+7FuGZcUtzgzL3/CGh5vwvXwotBSSoIXzSaN
	 PHleM5LjPFf2E9y23VHBgZhWKrzMDd1tASNSx0CXaVFjDdlSF7Vr9RwavFGupHPIXd
	 q60az/sYpgR+qXZ/oVH3UILZqPDU3t7Z5gud3kmm4gIl2IwNxI0KLSbLcnzkgE1vEi
	 xx7HXtJxZrM7Rm+PMXqla2mZozB0Ydue6vf+74aGT4gTegwr4GzMX7K7+Aj5fKqC8E
	 L7f5xXr39jnTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F0DCD8C92;
	Mon,  8 Jun 2026 13:04:31 +0000 (UTC)
From: Ferdinand Schwenk via B4 Relay <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Subject: [PATCH v2 0/3] hwmon: ina238: add samples and update_interval_us
 support
Date: Mon, 08 Jun 2026 15:03:53 +0200
Message-Id: <20260608-hwmon-ina238-update-interval-us-v2-v2-0-2d939fbb2ea1@advastore.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2N0QqDMAwAf0XyvECWipT9ythDWOMMbFFa7Qbiv
 6/4eHDc7VA0mxa4dTtkrVZs9gZ86eA5ib8ULTUGJh5ooIjT9zM7mguHiNuSZG2Kr5qrvHErWBm
 voe9jUhKKAVpoyTra75zcH8fxB21awOR0AAAA
X-Change-ID: 20260608-hwmon-ina238-update-interval-us-v2-13448de0a083
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, richard.leitner@linux.dev, 
 ferdinand.schwenk@advastore.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780923870; l=2059;
 i=ferdinand.schwenk@advastore.com; h=from:subject:message-id;
 bh=knZSIpSnPyE8xSKnsSBICwc7zFH7EviJsK2ZsdUIYnE=;
 b=karf5InTqgmwXUQey41hm4GWNyEIIzDyLm8CEDUcT6bGJBWHKWYy1U7e84zX0gZvGBv/6TyNa
 SA6Mb74wTlCCpux0f9J1u697Iyv/Tzb26dJLd3/KYJEKyWmwQe6IfFx
X-Developer-Key: i=ferdinand.schwenk@advastore.com; a=ed25519;
 pk=HyA9NdHJ7NystP+1SyuWJeyXNH2EO4A09FXli9mfs9Q=
X-Endpoint-Received: by B4 Relay for
 ferdinand.schwenk@advastore.com/default with auth_id=788
X-Original-From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
Reply-To: ferdinand.schwenk@advastore.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14863-lists,linux-hwmon=lfdr.de,ferdinand.schwenk.advastore.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:richard.leitner@linux.dev,m:ferdinand.schwenk@advastore.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[ferdinand.schwenk@advastore.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[advastore.com:mid,advastore.com:email,advastore.com:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA4416566B9

The INA238 family exposes ADC averaging and conversion timing controls
through ADC_CONFIG. Add support for the samples and update_interval
chip attributes and introduce a generic update_interval_us companion
attribute for devices that need sub-millisecond resolution.

The shortest INA238 conversion time steps are below 1 ms, so several
valid hardware settings collapse to the same update_interval value when
reported only in milliseconds. Keep update_interval in milliseconds as
required by the existing hwmon ABI and provide update_interval_us to
report and program the same total conversion cycle time with microsecond
resolution.

Patch 1 adds samples and update_interval support for the INA238 family.
Patch 2 adds the generic hwmon update_interval_us attribute and
documents it.
Patch 3 wires the new attribute up in the INA238 driver.

Link: https://lore.kernel.org/all/20260522-hwmon-ina238-add-samples-update-interval-v1-0-e1acfceb447e@advastore.com/
---
v2:
- keep update_interval in milliseconds to preserve the existing ABI
- add the generic update_interval_us hwmon chip attribute and documentation
- implement update_interval_us for ina238
- report and program intervals using the active averaging count

---
Ferdinand Schwenk (3):
      hwmon: ina238: add support for samples and update_interval
      hwmon: Add update_interval_us chip attribute
      hwmon: ina238: add update_interval_us attribute

 Documentation/ABI/testing/sysfs-class-hwmon |  14 +++
 Documentation/hwmon/ina238.rst              |   4 +
 Documentation/hwmon/sysfs-interface.rst     |   4 +
 drivers/hwmon/hwmon.c                       |   1 +
 drivers/hwmon/ina238.c                      | 160 +++++++++++++++++++++++++++-
 include/linux/hwmon.h                       |   2 +
 6 files changed, 183 insertions(+), 2 deletions(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260608-hwmon-ina238-update-interval-us-v2-13448de0a083

Best regards,
-- 
Ferdinand Schwenk <ferdinand.schwenk@advastore.com>



