Return-Path: <linux-hwmon+bounces-11614-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHY3HRmEhWmqCwQAu9opvQ
	(envelope-from <linux-hwmon+bounces-11614-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 06 Feb 2026 07:03:05 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE781FA888
	for <lists+linux-hwmon@lfdr.de>; Fri, 06 Feb 2026 07:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4DE2302BA26
	for <lists+linux-hwmon@lfdr.de>; Fri,  6 Feb 2026 06:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190B22EC090;
	Fri,  6 Feb 2026 06:03:03 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from carl-amd.amd.com (unknown [218.32.81.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFE32D837C;
	Fri,  6 Feb 2026 06:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.32.81.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770357783; cv=none; b=M0g+EoEfmCWnvWh8Au8/B4cOYpgPpHVwoCincmXI81ApKyOPbvuoj/kOWYbL47JHcDs1yXLID/P5jGUGQ2xRgLJoJULZo6dp2SDkccw10w4ibmvo4ejkvwO8xqitZyzobNfDZaYXxh+8OsTf8P3Rzv1rcqELrdtXve7xWuHjZew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770357783; c=relaxed/simple;
	bh=5ni1MN+rQF2mPjhb+eQuAuhxFYWrWeUb+IOk8x1yHR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2Ti2b9pLBBtqyjzjP1TiPvEMJdNGscRSMEv1NjSzFnOeOq9gdBwUlSIvxNP2k9n30bitrJfE/nYg2ajuNSue/dORnYcAah7ltTvv7dR46KwSnkeG9VpzGeVrRhNHqHAJVt/4he6M8qqZ6lHPL59KSk4Cd5tdhJptVHdfWbiXqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; arc=none smtp.client-ip=218.32.81.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Received: from carl-amd.amd.com (localhost [127.0.0.1])
	by carl-amd.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id 6165sKnR1007604;
	Fri, 6 Feb 2026 13:54:20 +0800
Received: (from carl@localhost)
	by carl-amd.amd.com (8.15.2/8.15.2/Submit) id 6165sIx21007603;
	Fri, 6 Feb 2026 13:54:18 +0800
X-Authentication-Warning: carl-amd.amd.com: carl set sender to carl.lee@amd.com using -f
Date: Fri, 6 Feb 2026 13:54:18 +0800
From: Carl Lee <carl.lee@amd.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, peter.shen@amd.com, colin.huang2@amd.com
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: pmbus: mpq8785: add MPQ8786
 support
Message-ID: <aYWAvWwjEXA1e/ny@carl-amd>
References: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com>
 <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-1-3744cd9b2850@amd.com>
 <20260205-cordial-warping-pronghorn-aeebe7@quoll>
 <79a6a2bc-4894-4ff9-8a11-5ed71195cf09@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79a6a2bc-4894-4ff9-8a11-5ed71195cf09@roeck-us.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,amd.com];
	TAGGED_FROM(0.00)[bounces-11614-lists,linux-hwmon=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XAW(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[carl.lee@amd.com,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE781FA888
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 08:17:07AM -0800, Guenter Roeck wrote:
> On Thu, Feb 05, 2026 at 02:46:29PM +0100, Krzysztof Kozlowski wrote:
> > On Thu, Feb 05, 2026 at 06:01:37PM +0800, Carl Lee wrote:
> > > Add device type support for MPQ8786
> > > 
> > > Signed-off-by: Carl Lee <carl.lee@amd.com>
> > > ---
> > >  Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> > > index 90970a0433e9..aec7397a29f9 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> > > @@ -19,6 +19,7 @@ properties:
> > >        - mps,mpm3695-25
> > >        - mps,mpm82504
> > >        - mps,mpq8785
> > > +      - mps,mpq8786
> > 
> > Your driver code says they are the same, so compatible. Express it with
> > fallback or provide real rationale in commit msg.
> > 
> 
> Agreed. The mpq8785 datasheet is public, but the mpq8786 datasheet isn't.
> That makes it all but impossible to determine if there are indeed no
> notable differences between the chips.
> 
> Guenter

Agreed. There is no chip-specific difference in the driver code to justify
separate MPQ8786 support. Therefore, we rely on MPQ8785 support.

