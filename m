Return-Path: <linux-hwmon+bounces-12834-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wN37H/YyxmnzHQUAu9opvQ
	(envelope-from <linux-hwmon+bounces-12834-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 27 Mar 2026 08:34:14 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17670340799
	for <lists+linux-hwmon@lfdr.de>; Fri, 27 Mar 2026 08:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 255D630B0E55
	for <lists+linux-hwmon@lfdr.de>; Fri, 27 Mar 2026 07:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02E53C9439;
	Fri, 27 Mar 2026 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kdda/cMN"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1AA14D29B;
	Fri, 27 Mar 2026 07:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774596311; cv=none; b=LDvonZNfxh33QwGJGFOZqNGWuCVmuYdtU7Tz4MlByR2QHMejoJMiiR5fwFta99vzsjeVn15es7QvoQAvIAAjpel2fiwHqmudV50pkKum8ocpz41G+bE8qLa6sHzEwcihK2VfSbNMY0BK5SSTGYM3ZOY1adXPgHMMkqDDl/dNNv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774596311; c=relaxed/simple;
	bh=udvT43EPq3bFj+u0f2V6lu78xvJCMoL7Yb7k9cm7NiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmPxL5Szde8eDpL2HHJcFbechaHZHAuOfuqidLfhw6/yoggOHB1OseKZOG5lYcmJohL4RbwjwwR0VK4o8KD61l+lpUeDNE2y8O7TMWWkdv//ZAXOVxHJzJ2vtXMUO4tJu/2keAEr2bU0H+AXWNSI37vCmnAml7IAmCNsxqBEheM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kdda/cMN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1EFC19424;
	Fri, 27 Mar 2026 07:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774596310;
	bh=udvT43EPq3bFj+u0f2V6lu78xvJCMoL7Yb7k9cm7NiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kdda/cMNd8jOTum+7WXeN8vqAsce5nMpQObDvxhAjgrex7nhszMYy8yXQ514IINum
	 Kjo6CqTOl9SNgoPz0meLKsNiVFedY9N9192HlK6MwWmdQ2vjTxeyyoEEhJKOv9QtL8
	 wIVcZi5taJRFT2SYIvQzcgFwNpRcraT1+V5ecMvo=
Date: Fri, 27 Mar 2026 08:24:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gupta <Akshay.Gupta@amd.com>
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux@roeck-us.net, arnd@arndb.de, Prathima.Lk@amd.com,
	naveenkrishna.chatradhi@amd.com, Anand.Umarji@amd.com,
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	kunyi@google.com
Subject: Re: [PATCH v1 5/6] misc: amd-sbi: Add SBTSI ioctl register transfer
 interface
Message-ID: <2026032706-comment-handsaw-8f1f@gregkh>
References: <20260323110811.2898997-1-Akshay.Gupta@amd.com>
 <20260323110811.2898997-6-Akshay.Gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323110811.2898997-6-Akshay.Gupta@amd.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12834-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 17670340799
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 04:38:10PM +0530, Akshay Gupta wrote:
> +	dev_info(&client->dev, "Removed sbtsi driver\n");

When drivers work properly, they are quiet.  No need for this kernel log
spam.

And were are all of these new ioctls documented and where is the
userspace tools that use them?

thanks,

greg k-h

