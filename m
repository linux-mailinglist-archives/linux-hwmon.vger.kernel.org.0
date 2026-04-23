Return-Path: <linux-hwmon+bounces-13483-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CV4wHxRn6WlLYgIAu9opvQ
	(envelope-from <linux-hwmon+bounces-13483-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 23 Apr 2026 02:25:56 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F6B44BEB6
	for <lists+linux-hwmon@lfdr.de>; Thu, 23 Apr 2026 02:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91B40300F9CA
	for <lists+linux-hwmon@lfdr.de>; Thu, 23 Apr 2026 00:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A670D1D435F;
	Thu, 23 Apr 2026 00:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvyEBkEv"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FFF1ACEDF
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2026 00:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776903805; cv=none; b=ZADLT3WVaMT4JmhUotdsQy+Is00xjrhKDMZs3FB7BivHBVanE2s7FKu/u+d+pvuNbAsbGIBsK8vlJbddDiB0UiHYIZrpgdETm80OvcBOt0DgR2dsI2YMdgxn88ojCY7/lz8HggHGWqfkAtDh9tqIth9x1DSRi6qAKX1Y5xbWG0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776903805; c=relaxed/simple;
	bh=ZhUT6cn4J7kLISTYfDzwGk7JAZbQCP+ztJ76+EjJAxc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E6myBNg18VDYcscSu+y0HJ52Ynz/AXDqnhlv15S5r1oGDz2TdSsObgCeXCMNuphU/sFlC+b/cc122HVkdBWq4/wDX2BgDQjk+YhfGySi5KrvpHNkAbX6rCpT7pZN+7SXPk1898qSDnrLsSN/EvmalJB6UAP0eSlLpQwfuVoe9oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvyEBkEv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A8FC19425;
	Thu, 23 Apr 2026 00:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776903805;
	bh=ZhUT6cn4J7kLISTYfDzwGk7JAZbQCP+ztJ76+EjJAxc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hvyEBkEvV4M6onVvVZmXpqt0dvlyajJaNf/PEwTefCc4Sqtc13eL8MUQOmdI5atIy
	 PCJv0as9y3E1qFiRCbMdDs6PawunyuYjSlHHb8sQlHMqG0tTDgezLpbKlr6kCemVl4
	 bZdfWMx4YscCauQ5SuUaXOxOIDTkr8yA3lI8eWZBKYa0mdHcm+QbO40+g8PLRGQW6l
	 M7T2oF/uwuu6izzhmySIYf2v4YDfTNzEhpdkwXaF5SiSV794UviD5LaecSBUI5R0gX
	 sQblUExGJdpKlVwfd+gqsJCUr3HoBzXAA0DWGGDxIRi7V0k6g1Mo+1z9iey7pWlN8R
	 +tUqeoyZYSuww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/12] dt-bindings: thermal: cooling-devices: Update
 support for 3 cells cooling device
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260422174305.2899095-13-daniel.lezcano@oss.qualcomm.com>
References: <20260422174305.2899095-13-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Apr 2026 00:23:24 +0000
Message-Id: <20260423002325.38A8FC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13483-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: 86F6B44BEB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sashiko AI review found 1 potential issue(s):
- [High] Schema Validation Loophole: Relaxing the global `#cooling-cells` p=
roperty allows invalid device tree configurations to pass schema validation.
--

commit 4d1db5332aa8215862512cf05a640de7afe86998
Author: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

dt-bindings: thermal: cooling-devices: Update support for 3 cells cooling d=
evice

This commit extends the thermal cooling device binding to support a 3 cells
specifier in addition to the 2 cells format. It updates the core
#cooling-cells property to an enum allowing both 2 and 3 arguments, and
adds an explicit constraint to pwm-fan.yaml.

> diff --git a/Documentation/devicetree/bindings/thermal/thermal-cooling-de=
vices.yaml b/Documentation/devicetree/bindings/thermal/thermal-cooling-devi=
ces.yaml
> --- a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.y=
aml
> +++ b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.y=
aml
[ ... ]
> @@ -44,10 +44,14 @@ select: true
>  properties:
>    "#cooling-cells":
>      description:
> -      Must be 2, in order to specify minimum and maximum cooling state u=
sed in
> +      Must be 2 or 3. If 2, specifies minimum and maximum cooling state =
used in
>        the cooling-maps reference. The first cell is the minimum cooling =
state
>        and the second cell is the maximum cooling state requested.
> -    const: 2
> +      If 3, the first cell specifies the thermal mitigation device speci=
fier
> +      index for devices that support multiple thermal mitigation mechani=
sms.
> +      The two other cells are respectively the minimum cooling state and=
 the
> +      maximum cooling state.
> +    enum: [2, 3]

By relaxing the core schema to allow 3 cells globally, does this
unintentionally create a validation loophole for other cooling providers?

Many specific cooling provider bindings (such as nvidia,tegra210-emc.yaml
or CPU nodes via arm/cpus.yaml) completely omitted local #cooling-cells
constraints because they relied entirely on this core schema to enforce
const: 2.

Since the core schema now allows 3 cells, any device binding lacking an
explicit const: 2 override will silently accept 3 cells, even if the
hardware or driver only supports 2.=20

Have all other existing cooling providers been audited and updated to ensure
they have a local const: 2 constraint where needed, similar to what was done
for pwm-fan.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260422174305.2899=
095-1-daniel.lezcano@oss.qualcomm.com?part=3D12

