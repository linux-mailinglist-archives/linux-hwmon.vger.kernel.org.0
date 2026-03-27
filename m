Return-Path: <linux-hwmon+bounces-12833-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AboEskwxmnzHQUAu9opvQ
	(envelope-from <linux-hwmon+bounces-12833-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 27 Mar 2026 08:24:57 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B620934059C
	for <lists+linux-hwmon@lfdr.de>; Fri, 27 Mar 2026 08:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6FB130479C2
	for <lists+linux-hwmon@lfdr.de>; Fri, 27 Mar 2026 07:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25473C942C;
	Fri, 27 Mar 2026 07:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cH4HqTK4"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAEA334681;
	Fri, 27 Mar 2026 07:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774596224; cv=none; b=CSq1fr4efvrgqBkA/JXQ8aZJ79/CsIOTUBxxBuI9DpEIh3BRW3b1dIOCcSvzk3kWlFACrd9akCnpwz8Sd7Svfhoir0pjWEE3JQQdqLyH92GoYd+Qyzijm+LMx2CN61u+c9TxImWaaYUPFLwZDLQtGXYr/a0ZTszZ9KRmCnyMBDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774596224; c=relaxed/simple;
	bh=hNkV4U4Ne2vAblE02kHs4MPylgG0H6YstBQuGkhqU8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcGLLu3lJFc1U21A/Ra5inPsFQROmKlqQEUuuT9zFTS5EZevVbrG4AlzlKfFWrdYj6HdoWV+wnxiQ41S7UdglpTeWjNUVTZweA45aQpVLJ+IO+Ilm9uwloKb8Ug4pdlqmEpB0xraMJPrQAWXteumXbI6dZEvF2u5U4jOiEek53U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cH4HqTK4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98952C19424;
	Fri, 27 Mar 2026 07:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774596223;
	bh=hNkV4U4Ne2vAblE02kHs4MPylgG0H6YstBQuGkhqU8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cH4HqTK4lefyPnJFE5FtPyGAoRbrw51H6ekijaZI/dS3SFY0uUo3r5Rf1T3YuNYGb
	 MvJL04AXWZK3NyTyf3bon2ss4mYfu1NTm22o1LxzyEGbHXnMD724ZNBDDsOROXHZa0
	 2BSVzvpOa+Qx3uLMXdQZm9CMjDJ6Z9YdzNR9b5eQ=
Date: Fri, 27 Mar 2026 08:23:18 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Gupta, Akshay" <Akshay.Gupta@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"L k, Prathima" <Prathima.Lk@amd.com>,
	"Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>,
	"Umarji, Anand" <Anand.Umarji@amd.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"kunyi@google.com" <kunyi@google.com>
Subject: Re: [PATCH v1 1/6] hwmon/misc: amd-sbi: Move core SBTSI support from
 hwmon to misc
Message-ID: <2026032744-humble-festival-0943@gregkh>
References: <20260323110811.2898997-1-Akshay.Gupta@amd.com>
 <20260323110811.2898997-2-Akshay.Gupta@amd.com>
 <86ec222b-d252-4586-a1cc-2a7a5674e1b4@roeck-us.net>
 <d0ed96aa-529d-42fb-a680-917c325998ee@amd.com>
 <91e527b8-f753-411b-bdf5-7439edb48c34@roeck-us.net>
 <9e05e255-6245-415c-8c74-ee4f1809976c@amd.com>
 <60ab1803-accb-4ac3-91bd-f6d24354c19a@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60ab1803-accb-4ac3-91bd-f6d24354c19a@roeck-us.net>
X-Spamd-Result: default: False [3.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-12833-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: B620934059C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 10:52:29PM -0700, Guenter Roeck wrote:
> On 3/26/26 22:07, Gupta, Akshay wrote:
> > 
> > On 3/24/2026 5:03 PM, Guenter Roeck wrote:
> > > Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> > > 
> > > 
> > > On 3/24/26 03:36, Gupta, Akshay wrote:
> > > > On 3/23/2026 7:45 PM, Guenter Roeck wrote:
> > > > > Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> > > > > 
> > > > > 
> > > > > On 3/23/26 04:08, Akshay Gupta wrote:
> > > > > > From: Prathima <Prathima.Lk@amd.com>
> > > > > > 
> > > > > > Move SBTSI core functionality out of the hwmon-only path and into
> > > > > > drivers/misc/amd-sbi so it can be reused by non-hwmon consumers.
> > > > > > 
> > > > > > This split prepares the driver for additional interfaces while keeping
> > > > > > hwmon support as an optional layer on top of common SBTSI core logic.
> > > > > > 
> > > > > This moves the driver out of hwmon space into misc/amd-sbi which,
> > > > > in my opinion, is completely unnecessary to accomplish the stated goals.
> > > > > 
> > > > > I assume this is to be able to make changes which do not follow
> > > > > the hwmon ABI and/or to bypass hwmon subsystem review, similar
> > > > > to what has been done by others.
> > > > > 
> > > > > Obviously, I think this is a bad idea. I won't give it a NACK,
> > > > > but I won't approve (nor review) it either.
> > > > > 
> > > > > Guenter
> > > > Hi Guenter,
> > > > 
> > > > Thank you for your quick response.
> > > > 
> > > > At present, TSI supports a range of functionalities that cannot be exposed through hwmon. Additionally, a new protocol leveraging the TSI endpoint in hardware has been introduced, which, to our understanding, cannot be accommodated within the hwmon subsystem.
> > > > 
> > > > Since we already support the RMI interface via misc/amd-sbi, we believe this remains the appropriate place to continue AMD's out-of-band support.
> > > > 
> > > > I will update the commit message and cover letter to clearly articulate the rationale behind this change.
> > > > 
> > > > Thank you
> > > > 
> > > That is neither a reason or an argument for moving _hwmon_ part of the code
> > > out of the hwmon subsystem.
> > Following feedback from the Greg and MFD subsystem maintainers, we introduced an sb-rmi driver under misc/ that calls devm_hwmon_device_register_with_info(). We are considering the same approach for the sb-tsi driver. Would you recommend a more suitable alternative?
> 
> I would have suggested to use an auxiliary driver, similar to PECI,
> but who am I to argue if senior maintainers suggest otherwise.

Sounds like an aux driver makes sense to me too, I don't remember saying
that you HAD to call devm_hwmon_device_register_with_info(), where was
that stated in previous reviews?

thanks,

greg k-h

