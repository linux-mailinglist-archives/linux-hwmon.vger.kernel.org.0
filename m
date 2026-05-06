Return-Path: <linux-hwmon+bounces-13792-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPlrCEGZ+mmQQAMAu9opvQ
	(envelope-from <linux-hwmon+bounces-13792-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 06 May 2026 03:28:33 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A97E4D5421
	for <lists+linux-hwmon@lfdr.de>; Wed, 06 May 2026 03:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EEBE302A2DC
	for <lists+linux-hwmon@lfdr.de>; Wed,  6 May 2026 01:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D3C23C368;
	Wed,  6 May 2026 01:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sYVAKITL"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060CD3770B;
	Wed,  6 May 2026 01:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778030564; cv=none; b=mpUtMLhx48iFnZS/ofV5MO0hHfnbPHSRk44BhfdHaJ23E76IvqFxL9TSXsORevr8IZMYka9ES6LsNPOcnqtIDdsbADU3xbiVCO2XtZBPGHa4aBGCe6QtPw7fEkBK1LQA75G/ACd01AxCxQUh6lJ8yV8PLKJSL0zWxJqHqxcqObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778030564; c=relaxed/simple;
	bh=vqpM+z6IMP1SGxcrsteKqQx3HnsRKEALogLdi1GJHyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVf4Z1nPJUw3TGMfjYL8EZ0eYhkZDqpsjb51x5lMV0H/AD794eari2CzQyHlwqihjXKOKDAjJ8qJ6xRXGVCBCERehSgU++EXZUUqx7Oc3916p34zkyhOOwKUkakmSg6cr+ohf7DOzp18pSqx75Q7gtYSuyUy9+EWvgV1lROUxgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sYVAKITL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D1CC2BCB4;
	Wed,  6 May 2026 01:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778030563;
	bh=vqpM+z6IMP1SGxcrsteKqQx3HnsRKEALogLdi1GJHyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYVAKITLvGAKNmtxbIXRltxdqMUvq9FzagmxdqvcZo+l3wHIZZoAH3RPXt1q0ub1w
	 jYFtdcqc1v6kVVYXGnu5GhzIxeYAXUUeF7TDp3bk9z6gG0B3yw6h02LNQN/HYIJsqa
	 SyCFyfCMM7V32UeY6J6F5Y9rDJMBg/mIhDou8x3SDT/sbK46YCObJ2YuYtLAXlcF+s
	 VRZzeNGqcEArn1XQmvL3bSvqzU0pLCgOCoOfdkqcAMHkUqaZdIY2XWZMiai1qn0FSR
	 tC2QxDCQHgkCt4olZ3N/q/h3OfB4qViCsr1WuJLisVoTtru0EZ6ZZuRx9qB2LRh+nv
	 8M2+gKjfmB7Yw==
Date: Tue, 5 May 2026 20:22:41 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko@lists.linux.dev
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Message-ID: <20260506012241.GA248179-robh@kernel.org>
References: <20260428082337.743546-2-changhuang.liang@starfivetech.com>
 <20260428193953.31ED7C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428193953.31ED7C2BCAF@smtp.kernel.org>
X-Rspamd-Queue-Id: 6A97E4D5421
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13792-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.905];
	TAGGED_RCPT(0.00)[linux-hwmon];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,11be0000:email,0.0.0.0:email,starfivetech.com:email]

On Tue, Apr 28, 2026 at 07:39:52PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The `tach-ch` property in the device tree example uses incorrect comma-separated syntax that evaluates to a 5-byte array rather than the intended 2-byte array.
> --
> 
> commit 4bf196984d444742e611042f289ee38d6b5ced8c
> Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> 
> dt-bindings: hwmon: Add starfive,jhb100-fan-tach
> 
> This commit adds the compatible string "starfive,jhb100-fan-tach" and the
> corresponding binding schema for the StarFive JHB100 Fan-Tach controller.
> The controller supports up to 16 fan tach inputs.
> 
> > diff --git a/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
> [ ... ]
> > +examples:
> > +  - |
> > +    fan-tach-controller@11be0000 {
> > +        compatible = "starfive,jhb100-fan-tach";
> > +        reg = <0x11be0000 0x400>;
> > +        interrupts = <128>;
> > +        clocks = <&per2crg 33>;
> > +        resets = <&per2crg 5>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        fan@0 {
> > +            reg = <0>;
> > +            tach-ch = /bits/ 8 <0x0>, <0x8>;
> 
> Is the comma-separated syntax in tach-ch intentional? In Device Tree Source
> syntax, the /bits/ 8 directive applies only to the immediately following
> angle-bracket block.
> 
> Because tach-ch = /bits/ 8 <0x0>, <0x8>; separates the values with a comma,
> the second block reverts to the default 32-bit cell size. This produces a
> 5-byte array [0x00, 0x00, 0x00, 0x00, 0x08] rather than the intended 2-byte
> array.
> 
> If a developer copies this example into a real device tree, will the driver
> incorrectly interpret it as 5 separate tachometer channels (0, 0, 0, 0, 8)
> instead of the intended 2 channels (0, 8)?
> 
> Should this be written as /bits/ 8 <0x0 0x8>; or using byte array syntax
> like [00 08] instead?

Yes. The former style though.

Rob

