Return-Path: <linux-hwmon+bounces-14323-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HQOI5UcDGoYWgUAu9opvQ
	(envelope-from <linux-hwmon+bounces-14323-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 19 May 2026 10:17:25 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 109D2579D1A
	for <lists+linux-hwmon@lfdr.de>; Tue, 19 May 2026 10:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BECD306630F
	for <lists+linux-hwmon@lfdr.de>; Tue, 19 May 2026 08:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648373DE427;
	Tue, 19 May 2026 08:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0GqzFDa"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B1439B946;
	Tue, 19 May 2026 08:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178182; cv=none; b=JCKtKj9aRIaIWcm8fwSi8GTCaTvhfxZQQegXLi6T9oqwqjTCKYUDhugt0em2JAzpwqlz30ze+6LHavbipL2sYGd9YICMByxvjPxawtprffzVpNhDrwReHbJB/3MEvQYU+LZv88UBsmhNamZ5GGdQdER1qCbfVOF3PIZaTrJsqbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178182; c=relaxed/simple;
	bh=1z0llbB/5MqtIw5ayrIuuamzLbbMx2Z9ClWX/iI01wE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DkAyoUY5VIfBUl8QRydNyKp8Ffw6mJemPrBM2pCaCgBOGIuFxsPqbhLiNFRCVGTEAt5JsjojzikHCl3JuqQ85WX9Q0qXs0GxMxVDdatBBofO20iK+G+98Gqkn/BtOnX30u0ARCeanrqvi4NPA2NOcTfvzeqjzNeBlkiS2cODo28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0GqzFDa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E303C2BCB3;
	Tue, 19 May 2026 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178182;
	bh=1z0llbB/5MqtIw5ayrIuuamzLbbMx2Z9ClWX/iI01wE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=U0GqzFDaAHF4SV+6AoryrTMx4VDaJcodtR7HsUVCl5G4DiL8GbaNl+yMrGXR3Hlbe
	 7wD3bOl5yemVuIDUXlT5IpLdbQAbo+AOy3TapFJzK8iOTDovB9KMsPg+bfOTr/nKqt
	 YcaELomtNj4bGvM0kPc7we3dZrmBSDjkLDuYfmH7RE9GqT/ln6yVR+qaGuY/k6Kq8u
	 dWGAZFDUhSm1nWTYOyWYcbyRH5+kdL+8pLmKx7Pm6uhVa9YQqxf0gY46KBCSeI3+FG
	 uRYf8oTrTFqupJlX9qcLBIi2JrB2ugdUe2o6rCrLdzt49y5RxGejmJfO/Ah6lyJwn0
	 Ga6OpoAEhNVsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP730
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519075558.91466-2-Ashish.Yadav@infineon.com>
References: <20260519075558.91466-2-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:09:40 +0000
Message-Id: <20260519080941.7E303C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14323-lists,linux-hwmon=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infineon.com:email,smtp.kernel.org:mid,devicetree.org:url,sashiko.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.11:email];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Queue-Id: 109D2579D1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The device tree example node is named `hwmon@11`, which uses a Linu=
x-specific subsystem name instead of a generic hardware function name.
- [Low] The new device tree binding `infineon,xdp730.yaml` unnecessarily du=
plicates the schema of the existing `infineon,xdp720.yaml`.
--

commit e021e1d189da7e8470a3c273fdd6ec12f7ed6280
Author: Ashish Yadav <ashish.yadav@infineon.com>

dt-bindings: hwmon/pmbus: Add Infineon XDP730

Add documentation for the device tree binding of the XDP730 eFuse.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp73=
0.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml
> new file mode 100644
> index 0000000000000..a7361a07891c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp730.yaml#

Does this file needlessly duplicate the existing infineon,xdp720.yaml schem=
a?

The properties, required fields, and constraints here appear identical
to infineon,xdp720.yaml. Creating duplicate YAML schema files for
devices in the same hardware family with identical constraints can
fragment the schemas.

Could the infineon,xdp730 compatible string be added to the enum in the
existing schema file instead?

[ ... ]

> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        hwmon@11 {

This isn't a bug, but does this node name follow the Devicetree
specification for generic names?

The spec requires node names to reflect the hardware function
(like efuse@11 or sensor@11), rather than pointing to a specific
OS subsystem like hwmon.

> +            compatible =3D "infineon,xdp730";
> +            reg =3D <0x11>;
> +            vdd-vin-supply =3D <&vdd_vin>;
> +            infineon,rimon-micro-ohms =3D <1098000000>;  /* 1.098k ohm */
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519075558.9146=
6-1-Ashish.Yadav@infineon.com?part=3D1

