Return-Path: <linux-hwmon+bounces-5907-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A903A02FE1
	for <lists+linux-hwmon@lfdr.de>; Mon,  6 Jan 2025 19:43:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 950A83A4890
	for <lists+linux-hwmon@lfdr.de>; Mon,  6 Jan 2025 18:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440B21DED5A;
	Mon,  6 Jan 2025 18:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="XCzR1VR5"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4752F1DDC23
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jan 2025 18:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736188990; cv=none; b=RVsluD5Y7ckuk0pz6/RqkJLuFQU3Eu4Q1qKK+Fn2SAHG7afE7xiojQolF8JtQr6Zl+j0gXBItZyPWqU5p6Xs78WAjIehIIgOGXSxKthbgEPNYOhBJdz6Y0PiHKRIRBmjWT5axkbP+JfhHhxJIQ0TADhjj4bVWTMD0NHfmgZCGZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736188990; c=relaxed/simple;
	bh=PzuymmHf0Sof8uB/+3TS5JFdIDpiI0yJ2rIPMF5hvvw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nrv6W14XujUl5eLkJDWj+3SKhZUZWeeetKm3lFBMUS0mfA1/tBWjGzMvGHiyNpOPDz5gBvV0ayj5N8lxq5KkqhwBulnumhNhQnNE3azXQeuh32feuyKyfDVh3Xj9+xVzZEm9MV4a2r6oyj9EF4t7SXcDD6YVrSBP5yluNI/ilO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=XCzR1VR5; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 727E1240028
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jan 2025 19:43:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736188986; bh=PzuymmHf0Sof8uB/+3TS5JFdIDpiI0yJ2rIPMF5hvvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=XCzR1VR5RjBikHmt3YaQ4nrXe11gVICtwDAPLyKv6QGWWQnK6m/jXJOyPTnvgUluU
	 JDmJG1kGxSg2Jw1uLJN5TKHPCFRfUvkYy+kcRKNZb1k4d78c01PKvX+eJxvnD0lLQP
	 uRQBbGN5M5FuT9pxI/wPWAqnn/hOqWYey5slD+lT2eRss5AO5egWAnGhQqE8qYLXoJ
	 5UDHNbxkvbTFqSU76Fh50to45V1DpXfvLr5oV5Ujij+TIIKDUBcXsq+uvQYQew3IV5
	 5El+Baz3sZTnMyALd+KiMFjRzA7tNbBs/ly3yD+nzJ0bMk05MoS030miz3LATQZw/m
	 ILrZNtdF3EgiQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YRjjj11J9z6twr;
	Mon,  6 Jan 2025 19:43:04 +0100 (CET)
Date: Mon,  6 Jan 2025 18:42:54 +0000
From: Daniil Stas <daniil.stas@posteo.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Chris Healy <cphealy@gmail.com>, Linus
 Walleij <linus.walleij@linaro.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Bart Van Assche <bvanassche@acm.org>,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-ide@vger.kernel.org
Subject: Re: [PATCH] hwmon: drivetemp: Fix driver producing garbage data
 when SCSI errors occur
Message-ID: <20250106204254.28b79000@pc>
In-Reply-To: <89d05805-74e4-4cf4-97e3-4d25314be013@roeck-us.net>
References: <20250105213618.531691-1-daniil.stas@posteo.net>
	<89d05805-74e4-4cf4-97e3-4d25314be013@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 6 Jan 2025 08:43:54 -0800
Guenter Roeck <linux@roeck-us.net> wrote:

> On Sun, Jan 05, 2025 at 09:36:18PM +0000, Daniil Stas wrote:
> > scsi_execute_cmd() function can return both negative (linux codes)
> > and positive (scsi_cmnd result field) error codes.
> > 
> > Currently the driver just passes error codes of scsi_execute_cmd()
> > to hwmon core, which is incorrect because hwmon only checks for
> > negative error codes. This leads to hwmon reporting uninitialized
> > data to userspace in case of SCSI errors (for example if the disk
> > drive was disconnected).
> > 
> > This patch checks scsi_execute_cmd() output and returns -EIO if it's
> > error code is positive.
> >   
> 
> Applied.
> 
> Thanks,
> Guenter

Thanks!

