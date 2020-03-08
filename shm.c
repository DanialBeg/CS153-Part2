#include "param.h"
#include "types.h"
#include "defs.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"

struct {
  struct spinlock lock;
  struct shm_page {
    uint id;
    char *frame;
    int refcnt;
  } shm_pages[64];
} shm_table;

void shminit() {
  int i;
  initlock(&(shm_table.lock), "SHM lock");
  acquire(&(shm_table.lock));
  for (i = 0; i< 64; i++) {
    shm_table.shm_pages[i].id =0;
    shm_table.shm_pages[i].frame =0;
    shm_table.shm_pages[i].refcnt =0;
  }
  release(&(shm_table.lock));
}

int shm_open(int id, char **pointer) {
int first_proc = 1;
proc *curproc = myproc();
acquire(&(shm_table.lock)); //mutual exclusion
 //CASE 1: Check the smh_table to see if the id that is trying to be opened already existed
for(unsigned int i = 0; i < 64; i++){
	if(shm_table.shm_pages[i].id == id){
		mappages(curproc()->pgdir, PGROUNDUP(curporc()->sz), PGSIZE, shm_table.shm_pages[i].frame, PTE_W|PTE_U);
		shm_table.shm_pages[i].refcnt++;
		*pointer = (char *)PGROUNDUP(curproc()->sz);
		curproc()->sz++;
		first_proc = 0;
	}
}
//END CASE1

//CASE 2: If the id is not on the shm_table we will make our id the first to do so
if(first_proc == 1){
	for(unsigned int i = 0; i < 64; i++){
		if(shm_table.shm_pages[i].id == 0){
			shm_table.shm_pages[i].id = id; // The new id is this
			shm_table.shm_pages[i].frame = kalloc(); 
			shm_table.shm_pages[i].refcnt = 1; // Only one item is connected here
			mappages(curproc->pgdir, PGROUNDUP(curproc()->sz), PGSIZE, shm_table.shm_pages[i].frame, PTE_W|PTE_U);
			*pointer = (char *)PGROUNDUP(curproc()->sz);
			curproc()->sz++;		
			break;
		}
	}		
}


release(&(shm_table.lock)); // mutual exclusion ending




return 0; //added to remove compiler warning -- you should decide what to return
}


int shm_close(int id) {
//you write this too!




return 0; //added to remove compiler warning -- you should decide what to return
}
