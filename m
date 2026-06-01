Return-Path: <linux-hwmon+bounces-14667-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG2YNV3ZHWpsfQkAu9opvQ
	(envelope-from <linux-hwmon+bounces-14667-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 01 Jun 2026 21:11:25 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EAB62475F
	for <lists+linux-hwmon@lfdr.de>; Mon, 01 Jun 2026 21:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 722AC300DDF9
	for <lists+linux-hwmon@lfdr.de>; Mon,  1 Jun 2026 19:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5E1360EDC;
	Mon,  1 Jun 2026 19:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqLtRJ5H"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE5C35AC1C;
	Mon,  1 Jun 2026 19:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780340768; cv=none; b=fWHb94gwGn/3bfivBHaYSaDiCVAcsbyoQlgiEYvTyWtRTAMNyxLHQcjusA4d0E/vEwcxD5Uea86EgB8grQQ9jS0lYOiC2r1e+RhgQHttJx0RW04ENiYFOxcgkox4PrSMsSM+VODJEqHONZRv/DVNsG6UrqpXaG13sdVvyid+X3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780340768; c=relaxed/simple;
	bh=zW5h6wNBZLLAEYLW/HbkS1Wzq/ZR8yZUfFPGB7CoSBo=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F4DZdLPxRnl+6PWmWGHZM94oM+Ptf+JXTEnaww+86ijG43aVK5+9QX+Bt06E06PMn2haoImdZLezu3logPlX+qOR0jGpkPaC8TkLobN6vNZOBMw9SS9ZA/Znu8Wd0ke/Pl61MrtWCtEgqXLlNZ6RjuE3OaHmbHeTUl0A9liJYDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqLtRJ5H; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BADC1F00893;
	Mon,  1 Jun 2026 19:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780340766;
	bh=CZuetJUt3wuRiQyEXhAsyUad77dJIJnNeE7cWA5pi6I=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=TqLtRJ5HkCl5D7v2rH7hVfJ54D/3Iccq+jKpbtHOlObklOgel3/wv9iWVLBAJTs6A
	 Ea9khBV9/N0eGwQhbREqdJgoj8kD46lsUAq327ShFIcSozfpPhvdz//UkUTD1s2Ume
	 hV6yQemdOGuHhpU4givsMvuai1B5bychKR1osLuoX8CV9tCaHMEPmTYvAMrYbHPa4d
	 TtALbCbyxg8vLa8hGfnKEO9eBSN6xyeutWpBQX0Il4vGD8sbZnP/BgFiRN7xdNZYYy
	 J9l23qLzSc5Y2SrBMdthameeVTLfDYP8w3kHAIWCzFrvgIFmjD0lUfyeFkVxBkmcO5
	 JYwoq+e4SKumw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Reply-To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260601184516.919488-3-sanman.pradhan@hpe.com>
References: <20260601184516.919488-3-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 19:06:06 +0000
Message-Id: <20260601190606.8BADC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [1.84 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	MISSING_TO(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14667-lists,linux-hwmon=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,hpe.com:email,smtp.kernel.org:mid]
X-Rspamd-Queue-Id: 82EAB62475F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Mismatch between the driver's regulator node expectation and the d=
evice tree binding schema, causing DT regulator properties to be silently i=
gnored and the regulator to be unusable by consumers.
--

commit 66bb21f2d9ec87355cc55cca84538b6ad8d8842c
Author: Syed Arif <arif.syed@hpe.com>

hwmon: (pmbus/max20860a) Add driver for Analog Devices MAX20860A

This commit adds a new PMBus driver for the Analog Devices MAX20860A
step-down DC-DC switching regulator. It provides hardware monitoring for
voltage, current, and temperature, along with optional regulator framework
support.

> diff --git a/drivers/hwmon/pmbus/max20860a.c b/drivers/hwmon/pmbus/max208=
60a.c
> new file mode 100644
> index 0000000000000..905f916f6c089
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/max20860a.c
[ ... ]
> @@ -0,0 +1,68 @@
[ ... ]
> +#include <linux/regulator/driver.h>
> +#include "pmbus.h"
> +
> +#if IS_ENABLED(CONFIG_SENSORS_MAX20860A_REGULATOR)
> +static const struct regulator_desc max20860a_reg_desc[] =3D {
> +	PMBUS_REGULATOR_ONE("vout"),

[Severity: High]
Will this prevent the regulator core from matching the device tree node?

The PMBUS_REGULATOR_ONE("vout") macro sets of_match to "vout". During
registration, the regulator core searches for a child node named "vout"
or a parent node with that exact name to associate the of_node.

If the device tree schema expects regulator properties directly on the
parent node (which is typically named generically, like regulator@xx),
will the regulator core fail to match the node?

If the match fails, the regulator is registered with of_node =3D NULL,
which silently ignores regulator constraints and prevents consumers
from referencing it as a supply.

> +};
> +#endif
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601184516.9194=
88-1-sanman.pradhan@hpe.com?part=3D2

